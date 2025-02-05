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
                  "rule_set": [
                        "geosite-gfw"
                  ],
                  "server": "google"
                },
                {
                "outbound": "any",
                "server": "alidns"
                }
          ],
          "final": "alidns",
          "disable_cache": true,
          "strategy": "ipv4_only"
        },
        "inbounds": [
                {
                        "type": "tun",
                        "address": [
                                "26.26.26.1/30"
                        ],
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
                        "tag": "trojan",
                        "type": "trojan",
                "server": "xxx",
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
                                "rule_set": [
                                        "geosite-cn"
                                ],
                                "outbound": "direct"
                        },
                        {
                                "rule_set": [
                                        "geosite-gfw"
                                ],
                                "outbound": "trojan"
                        }
                ],
                "rule_set": [
                        {
                                "tag": "geosite-cn",
                                "type": "remote",
                                "format": "binary",
                                "url": "https://cdn.jsdelivr.net/gh/Loyalsoldier/geoip@release/srs/cn.srs",
                                "download_detour": "direct"
                        },
                        {
                                "tag": "geosite-gfw",
                                "type": "remote",
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
