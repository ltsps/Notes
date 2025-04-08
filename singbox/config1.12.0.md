{
  "log": {
    "level": "trace",
    "timestamp": true
  },
  "dns": {
    "servers": [
      {
        "type": "tls",
        "tag": "google",
        "detour": "trojan",
        "domain_resolver": "alidns",
        "server": "dns.google",
        "server_port": 853
      },
      {
        "type": "udp",
        "tag": "alidns",
        "server": "223.5.5.5"
      }
    ],
    "strategy": "ipv4_only"
  },
  "inbounds": [
    {
      "type": "tun",
      "address": "26.26.26.1/30",
      "auto_route": true
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
      "domain_resolver": "alidns",
      "server": "xxxx",
      "server_port": 443,
      "password": "xxx",
      "tls": {
        "enabled": true,
        "server_name": "xxx",
        "insecure": true
      },
      "transport": {
        "type": "ws",
        "path": "/xxx"
      }
    }
  ],
  "route": {
    "rules": [
      {
        "action": "sniff"
      },
      {
        "protocol": "dns",
        "action": "hijack-dns"
      },
      {
        "rule_set": "geosite-cn",
        "outbound": "direct"
      },
      {
        "rule_set": [
          "geosite-gfw",
          "geoip-us"
        ],
        "outbound": "trojan"
      }
    ],
    "rule_set": [
      {
        "type": "remote",
        "tag": "geosite-gfw",
        "format": "binary",
        "url": "https://cdn.jsdelivr.net/gh/Loyalsoldier/geoip@release/srs/us.srs",
        "download_detour": "direct"
      },
      {
        "type": "remote",
        "tag": "geosite-cn",
        "format": "binary",
        "url": "https://cdn.jsdelivr.net/gh/Loyalsoldier/geoip@release/srs/cn.srs",
        "download_detour": "direct"
      },
      {
        "type": "remote",
        "tag": "geoip-us",
        "format": "binary",
        "url": "https://raw.githubusercontent.com/SagerNet/sing-geoip/rule-set/geoip-us.srs",
        "download_detour": "trojan"
      }
    ],
    "auto_detect_interface": true
  },
  "experimental": {
    "cache_file": {
      "enabled": true
    }
  }
}
