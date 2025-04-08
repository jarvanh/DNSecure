//
//  Presets.swift
//  DNSecure
//
//  Created by Kenta Kubo on 9/25/20.
//

import Foundation

enum Presets {
    static let servers: Resolvers = [
        .init(
            name: "Google Public DNS",
            configuration: .dnsOverTLS(
                DoTConfiguration(
                    servers: [
                        "8.8.8.8",
                        "8.8.4.4",
                        "2001:4860:4860::8888",
                        "2001:4860:4860::8844",
                    ],
                    serverName: "dns.google"
                )
            )
        ),
        .init(
            name: "Google Public DNS",
            configuration: .dnsOverHTTPS(
                DoHConfiguration(
                    servers: [
                        "8.8.8.8",
                        "8.8.4.4",
                        "2001:4860:4860::8888",
                        "2001:4860:4860::8844",
                    ],
                    serverURL: URL(string: "https://dns.google/dns-query")
                )
            )
        ),
        .init(
            name: "1.1.1.1",
            configuration: .dnsOverTLS(
                DoTConfiguration(
                    servers: [
                        "1.1.1.1",
                        "1.0.0.1",
                        "2606:4700:4700::1111",
                        "2606:4700:4700::1001",
                    ],
                    serverName: "cloudflare-dns.com"
                )
            )
        ),
        .init(
            name: "1.1.1.1",
            configuration: .dnsOverHTTPS(
                DoHConfiguration(
                    servers: [
                        "1.1.1.1",
                        "1.0.0.1",
                        "2606:4700:4700::1111",
                        "2606:4700:4700::1001",
                    ],
                    serverURL: URL(string: "https://cloudflare-dns.com/dns-query")
                )
            )
        ),
        .init(
            name: "1.1.1.1 (Block Malware)",
            configuration: .dnsOverTLS(
                DoTConfiguration(
                    servers: [
                        "1.1.1.2",
                        "1.0.0.2",
                        "2606:4700:4700::1112",
                        "2606:4700:4700::1002",
                    ],
                    serverName: "cloudflare-dns.com"
                )
            )
        ),
        .init(
            name: "1.1.1.1 (Block Malware)",
            configuration: .dnsOverHTTPS(
                DoHConfiguration(
                    servers: [
                        "1.1.1.2",
                        "1.0.0.2",
                        "2606:4700:4700::1112",
                        "2606:4700:4700::1002",
                    ],
                    serverURL: URL(string: "https://security.cloudflare-dns.com/dns-query")
                )
            )
        ),
        .init(
            name: "Quad9 (Block Malware)",
            configuration: .dnsOverTLS(
                DoTConfiguration(
                    servers: [
                        "9.9.9.9",
                        "149.112.112.112",
                        "2620:fe::fe",
                        "2620:fe::9",
                    ],
                    serverName: "dns.quad9.net"
                )
            )
        ),
        .init(
            name: "Quad9 (Block Malware)",
            configuration: .dnsOverHTTPS(
                DoHConfiguration(
                    servers: [
                        "9.9.9.9",
                        "149.112.112.112",
                        "2620:fe::fe",
                        "2620:fe::9",
                    ],
                    serverURL: URL(string: "https://dns.quad9.net/dns-query")
                )
            )
        ),
        .init(
            name: "LibreDNS",
            configuration: .dnsOverTLS(
                DoTConfiguration(
                    servers: [
                        "116.202.176.26"
                    ],
                    serverName: "dot.libredns.gr"
                )
            )
        ),
        .init(
            name: "LibreDNS",
            configuration: .dnsOverHTTPS(
                DoHConfiguration(
                    servers: [
                        "116.202.176.26"
                    ],
                    serverURL: URL(string: "https://doh.libredns.gr/dns-query")
                )
            )
        ),
        .init(
            name: "LibreDNS (Block Ads / Trackers)",
            configuration: .dnsOverHTTPS(
                DoHConfiguration(
                    servers: [
                        "116.202.176.26"
                    ],
                    serverURL: URL(string: "https://doh.libredns.gr/ads")
                )
            )
        ),
        .init(
            name: "AdGuard DNS",
            configuration: .dnsOverTLS(
                DoTConfiguration(
                    servers: [
                        "94.140.14.140",
                        "94.140.14.141",
                        "2a10:50c0::1:ff",
                        "2a10:50c0::2:ff",
                    ],
                    serverName: "dns-unfiltered.adguard.com"
                )
            )
        ),
        .init(
            name: "AdGuard DNS",
            configuration: .dnsOverHTTPS(
                DoHConfiguration(
                    servers: [
                        "94.140.14.140",
                        "94.140.14.141",
                        "2a10:50c0::1:ff",
                        "2a10:50c0::2:ff",
                    ],
                    serverURL: URL(string: "https://dns-unfiltered.adguard.com/dns-query")
                )
            )
        ),
        .init(
            name: "AdGuard DNS (Block Ads / Trackers)",
            configuration: .dnsOverTLS(
                DoTConfiguration(
                    servers: [
                        "94.140.14.14",
                        "94.140.15.15",
                        "2a10:50c0::ad1:ff",
                        "2a10:50c0::ad2:ff",
                    ],
                    serverName: "dns.adguard.com"
                )
            )
        ),
        .init(
            name: "AdGuard DNS (Block Ads / Trackers)",
            configuration: .dnsOverHTTPS(
                DoHConfiguration(
                    servers: [
                        "94.140.14.14",
                        "94.140.15.15",
                        "2a10:50c0::ad1:ff",
                        "2a10:50c0::ad2:ff",
                    ],
                    serverURL: URL(string: "https://dns.adguard.com/dns-query")
                )
            )
        ),
        .init(
            name: "Freifunk Muenchen DNS",
            configuration: .dnsOverTLS(
                DoTConfiguration(
                    servers: [
                        "5.1.66.255",
                        "185.150.99.255",
                        "2001:678:e68:f000::",
                        "2001:678:ed0:f000::",
                    ],
                    serverName: "dot.ffmuc.net"
                )
            )
        ),
        .init(
            name: "Freifunk Muenchen DNS",
            configuration: .dnsOverHTTPS(
                DoHConfiguration(
                    servers: [
                        "5.1.66.255",
                        "185.150.99.255",
                        "2001:678:e68:f000::",
                        "2001:678:ed0:f000::",
                    ],
                    serverURL: URL(string: "https://doh.ffmuc.net/dns-query")
                )
            )
        ),
    ]
}
