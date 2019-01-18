# [![DnsControl](https://img.shields.io/chocolatey/v/dnscontrol.svg?label=DnsControl&style=for-the-badge)](https://chocolatey.org/packages/dnscontrol)

DnsControl is an [opinionated][] platform for seamlessly managing your DNS configuration across any number of DNS hosts, both in the cloud or in your own infrastructure. It manages all of the domains for the Stack Overflow network, and can do the same for your.

## Features

- Maintain your DNS data as high-level DS, with macros, and variables for easier updates.
- Eliminate vendor lock-in. Switch DNS providers easily, any time, with full fidelity.
- Supports 10+ DNS Providers including BIND, AWS Route 53, Google DNS, and name.com
- All the benefits of Git (or any VCS) for your DNS zone data. View history. Accept PRs.
- Runs on Linux, Windows, Mac, or any operating system supported by Go.
- Assign an IP address to a constant and use the variable name throughout the configuration. Need to change the IP address globally? Just change the variable and "recompile."
- Super extensible! Plug-in architecture makes adding new DNS providers and Registrars easy!
- Reduce point of failure: Easily maintain dual DNS providers and easily drop one that is down.
- Apply CI/CD principles to DNS: Unit-tests, system-tests, automated deployment.
- Optimize DNS with SPF optimizer. Detect too many lookups. Flatten includes.
- Enable/disable Cloudflare proxying (the "orange cloud" button) directly from your DNSControl files.
- Keep similar domains in sync with transforms, macros, and variables.

[opinionated]: https://stackexchange.github.io/dnscontrol/opinions
