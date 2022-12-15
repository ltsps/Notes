function FindProxyForURL(url, host) {
  if (dnsDomainIs(host, "google.com") ||
      dnsDomainIs(host, "googleapis.com") ||
      dnsDomainIs(host, "youtube.com") ||
      dnsDomainIs(host, "ggpht.com") ||
      dnsDomainIs(host, "ytimg.com") ||
      dnsDomainIs(host, "googlesyndication.com") ||
      dnsDomainIs(host, "googlevideo.com")
) {
    return "SOCKS 192.168.1.233:1080";
  }
    return "DIRECT";
}
