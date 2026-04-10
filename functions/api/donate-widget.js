export async function onRequestGet() {
  const UPSTREAM = 'https://cdn.fundraiseup.com/widget/AAYKECHT';

  try {
    const res = await fetch(UPSTREAM, {
      headers: {
        'User-Agent': 'Mozilla/5.0 (compatible; StormyCloudProxy/1.0)',
        'Accept': 'application/javascript, text/javascript, */*',
      },
      cf: { cacheTtl: 3600, cacheEverything: true },
    });

    if (!res.ok) {
      return new Response('/* upstream error */', {
        status: 502,
        headers: { 'Content-Type': 'application/javascript; charset=utf-8' },
      });
    }

    return new Response(await res.text(), {
      status: 200,
      headers: {
        'Content-Type': 'application/javascript; charset=utf-8',
        'Cache-Control': 'public, max-age=3600, s-maxage=3600',
        'X-Content-Type-Options': 'nosniff',
      },
    });
  } catch (e) {
    return new Response('/* proxy fetch failed */', {
      status: 502,
      headers: { 'Content-Type': 'application/javascript; charset=utf-8' },
    });
  }
}
