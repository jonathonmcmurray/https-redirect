# https-redirect

[![Anaconda-Server Badge](https://anaconda.org/jmcmurray/https-redirect/badges/version.svg)](https://anaconda.org/jmcmurray/https-redirect)
[![Anaconda-Server Badge](https://anaconda.org/jmcmurray/https-redirect/badges/downloads.svg)](https://anaconda.org/jmcmurray/https-redirect)

HTTP to HTTPS redirection for kdb+/q

Simple package enabling HTTP -> HTTPS redirection for a q web server

Sends `301 Moved Permanently` to redirect clients to HTTPS (in cachable manner
for clients that support caching)

## Usage

Installation:

```bash
$ conda install -c jmcmurray https-redirect
```

Loading:

```q
q).utl.require"https-redirect"
```

Ensure any custom `.z.ph` & `.z.pp` definitions are defined before loading module

More details, see blog post: https://jmcmurray.co.uk/kdb/q/http/https/ssl/tls/2018/12/10/https-redirect.html
