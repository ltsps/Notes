# config.json
{
  "log": {
    "level": "debug"
  },
  "dns": {
    "servers": [
      {
        "tag": "google",
        "address": "https://dns.google/dns-query",
        "address_resolver": "alidns",
        "detour": "trojan"
      },
      {
        "tag": "alidns",
        "address": "223.5.5.5",
        "detour": "direct"
      },
      {
        "tag": "block",
        "address": "rcode://success"
      }
    ],
    "rules": [
      {
        "rule_set": "geosite-gfw",
        "server": "google"
      },
      {
        "outbound": "any",
        "server": "alidns"
      }
    ],
    "final": "alidns",
    "strategy": "ipv4_only",
    "disable_cache": true
  },
  "inbounds": [
    {
      "type": "tun",
      "address": "26.26.26.1/30",
      "auto_route": true,
      "sniff": true
    }
  ],
  "outbounds": [
    {
      "type": "direct",
      "tag": "direct"
    },
    {
      "type": "trojan",
      "tag": "trojan",
      "server": "www.lysps.uk",
      "server_port": 443,
      "password": "Gwycel_305",
      "tls": {
        "enabled": true,
        "server_name": "www.lysps.uk",
        "insecure": true
      },
      "transport": {
        "type": "ws",
        "path": "/0GYiBWiYy7hZSVcBxMkk"
      }
    },
    {
      "type": "block",
      "tag": "block"
    },
    {
      "type": "dns",
      "tag": "dns-out"
    }
  ],
  "route": {
    "rules": [
      {
        "protocol": "dns",
        "outbound": "dns-out"
      },
      {
        "rule_set": "geosite-cn",
        "outbound": "direct"
      },
      {
        "rule_set": "geosite-gfw",
        "outbound": "trojan"
      }
    ],
    "rule_set": [
      {
        "type": "remote",
        "tag": "geosite-cn",
        "format": "binary",
        "url": "https://cdn.jsdelivr.net/gh/Loyalsoldier/geoip@release/srs/cn.srs",
        "download_detour": "direct"
      },
      {
        "type": "remote",
        "tag": "geosite-gfw",
        "format": "binary",
        "url": "https://cdn.jsdelivr.net/gh/Loyalsoldier/geoip@release/srs/us.srs",
        "download_detour": "direct"
      }
    ],
    "final": "direct",
    "auto_detect_interface": true
  },
  "experimental": {
    "cache_file": {
      "enabled": true
    }
  }
}
