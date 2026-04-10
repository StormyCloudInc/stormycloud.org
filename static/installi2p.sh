#!/usr/bin/env bash
set -e

echo ""
echo "  ██╗██████╗ ██████╗"
echo "  ██║╚════██╗██╔══██╗"
echo "  ██║ █████╔╝██████╔╝"
echo "  ██║██╔═══╝ ██╔═══╝"
echo "  ██║███████╗██║"
echo "  ╚═╝╚══════╝╚═╝  Linux Installer"
echo ""
echo "  Installing I2P with default settings..."
echo ""

# ─── Install ────────────────────────────────────────────────────────────────

DOCKER_INSTALL=false

if grep -qiE "^ID=\"?(ubuntu|linuxmint|pop|elementary)" /etc/os-release; then
    echo "  Detected Ubuntu-based"

    export DEBIAN_FRONTEND=noninteractive
    echo "i2p i2p/daemon boolean true" | sudo debconf-set-selections 2>/dev/null

    sudo apt-get update -qq
    sudo apt-get install -y -qq software-properties-common apt-transport-https curl > /dev/null
    sudo add-apt-repository -y ppa:i2p-maintainers/i2p > /dev/null 2>&1
    sudo apt-get update -qq
    sudo apt-get install -y -qq i2p > /dev/null
    sudo dpkg-reconfigure -f noninteractive i2p 2>/dev/null

elif grep -qiE "^ID=\"?debian" /etc/os-release; then
    echo "  Detected Debian"

    export DEBIAN_FRONTEND=noninteractive
    echo "i2p i2p/daemon boolean true" | sudo debconf-set-selections 2>/dev/null

    sudo apt-get update -qq
    sudo apt-get install -y -qq apt-transport-https lsb-release curl gnupg2 > /dev/null

    CODENAME=$(lsb_release -sc)
    KEYRING="/usr/share/keyrings/i2p-archive-keyring.gpg"

    sudo curl -so "$KEYRING" https://i2p.net/i2p-archive-keyring.gpg
    echo "deb [signed-by=$KEYRING] https://deb.i2p.net/ $CODENAME main" \
        | sudo tee /etc/apt/sources.list.d/i2p.list > /dev/null

    sudo apt-get update -qq
    sudo apt-get install -y -qq i2p i2p-keyring > /dev/null
    sudo dpkg-reconfigure -f noninteractive i2p 2>/dev/null

elif grep -qiE "^ID=\"?(centos|rhel|almalinux|rocky)" /etc/os-release; then
    DISTRO_NAME=$(. /etc/os-release && echo "$NAME")
    echo "  Detected ${DISTRO_NAME}"

    EL_VER=$(. /etc/os-release && echo "${VERSION_ID%%.*}")
    EL_ARCH=$(uname -m)

    if [ "$EL_ARCH" = "x86_64" ]; then
        if [ "$EL_VER" = "9" ]; then
            COPR_CHROOT="alma+epel-9-x86_64"
        else
            COPR_CHROOT="alma+epel-${EL_VER}-x86_64_v2"
        fi
    else
        COPR_CHROOT="epel-${EL_VER}-${EL_ARCH}"
    fi

    COPR_REPO_URL="https://download.copr.fedorainfracloud.org/results/i2porg/i2p/${COPR_CHROOT}/"
    COPR_GPG_URL="https://download.copr.fedorainfracloud.org/results/i2porg/i2p/pubkey.gpg"

    sudo tee /etc/yum.repos.d/i2p-copr.repo > /dev/null << REPO
[copr:copr.fedorainfracloud.org:i2porg:i2p]
name=Copr repo for i2p owned by i2porg
baseurl=${COPR_REPO_URL}
type=rpm-md
skip_if_unavailable=True
gpgcheck=1
gpgkey=${COPR_GPG_URL}
repo_gpgcheck=0
enabled=1
enabled_metadata=1
REPO

    sudo dnf install -y i2p > /dev/null

elif grep -qiE "^ID=\"?fedora" /etc/os-release; then
    echo "  Detected Fedora"

    sudo dnf copr enable -y i2porg/i2p > /dev/null 2>&1
    sudo dnf install -y i2p > /dev/null

elif grep -qiE "^ID=\"?.*opensuse" /etc/os-release; then
    if grep -qi "tumbleweed" /etc/os-release; then
        echo "  Detected openSUSE Tumbleweed"
        REPO_URL="https://download.opensuse.org/repositories/home:i2p/openSUSE_Tumbleweed/home:i2p.repo"
    else
        echo "  Detected openSUSE Leap"
        REPO_URL="https://download.opensuse.org/repositories/home:i2p/openSUSE_Leap_15.6/home:i2p.repo"
    fi

    sudo zypper addrepo -f "$REPO_URL" > /dev/null 2>&1
    sudo zypper --gpg-auto-import-keys refresh > /dev/null 2>&1
    sudo zypper install -y i2p > /dev/null

else
    echo "  Unsupported distribution."
    read -p "  Install I2P via Docker instead? [y/N]: " answer < /dev/tty

    if [[ ! "$answer" =~ ^[Yy] ]]; then
        echo "  Exiting. Visit https://geti2p.net for other options."
        exit 1
    fi

    if ! command -v docker &> /dev/null; then
        echo "  Installing Docker..."
        curl -fsSL https://get.docker.com 2>/dev/null | sh > /dev/null 2>&1
        sudo systemctl enable --now docker > /dev/null 2>&1
    fi

    echo "  Starting I2P container..."
    sudo docker pull geti2p/i2p > /dev/null
    sudo docker volume create i2p-data > /dev/null
    sudo docker run -d \
        --name i2p \
        --restart unless-stopped \
        -v i2p-data:/i2p/.i2p \
        -p 7657:7657 \
        -p 4444:4444 \
        -p 4445:4445 \
        geti2p/i2p > /dev/null

    DOCKER_INSTALL=true
fi

echo "  I2P installed."

# Fix /var/lib/i2p ownership (COPR RPM creates it as root:root but service runs as i2p)
if id i2p &>/dev/null && [ -d "/var/lib/i2p" ]; then
    sudo chown -R i2p:i2p /var/lib/i2p
fi

# ─── Start service ───────────────────────────────────────────────────────────

if [ "$DOCKER_INSTALL" = false ]; then
    sudo systemctl enable --now i2p > /dev/null 2>&1
fi

# ─── Done ────────────────────────────────────────────────────────────────────

echo ""
echo "  I2P is running. Router console: http://127.0.0.1:7657"
echo ""
