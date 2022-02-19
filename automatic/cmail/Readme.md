# [![CMail](https://img.shields.io/chocolatey/v/cmail.svg?label=CMail&style=for-the-badge)](https://community.chocolatey.org/packages/cmail)

CMail is a freeware command line e-mail sending tool for Windows, primarily intended for sending scripted e-mail, but it is simple enough to be used interactively. If you are looking for an alternative to Blat with SSL support, or more control over message formatting, CMail may be a good choice.

CMail is not intended to be a better Blat, it was developed to assist with testing mail server and content analysis software, and as such has evolved with a completely different feature set. While being very easy to use in its basic form, CMail provides advanced options for those who require them, allowing users to specify such things as the encoding mechanism for the message body and individual attachments, the types of authentication mechanisms to use, aliases for all recipients (similar software often doesn't support aliases, or can only send to a single user), and per-recipient Delivery Status Notification settings. Users can also control various aspects of the SMTP session, including enforcing the use of SSL/TLS where security is a consideration, setting the HELO/EHLO, adding custom headers, and mandating the use of IPv4 or IPv6.

## Features

- IPv6 support.
- TLS/SSL via STARTTLS or SMTPS (SSL-enabled version). Built-in, stunnel not required.
- Support for adding multipart/alternative HTML message bodies (UTF-8) and embedded images.
- Delivery Status Notification and Message Disposition Notification (Read receipt) support.
- SMTP authentication using CRAM-MD5, PLAIN, and LOGIN.
- Message bodies using plain text, base64, or quoted printable encoding.
- Unlimited attachments using base64, quoted printable, uuencoding or yEnc.
- Wildcard attachment support to attach directory content.
- Unlimited To/Cc/Bcc recipients, with aliases and DSN options for each if desired.
- Read message body from command line, stdin or file.
- Sending via SOCKS or HTTPS proxies.
- Flexible configuration via files or the command line.
- Written entirely in C - no need for .NET libraries, Java, or other prerequisites.
- No installation required. Download, extract, use.
- Free for private and commercial use.
