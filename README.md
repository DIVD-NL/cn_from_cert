This shell and Pyton script combined connect to an IP (on a port), download the certificate,
get the Common Name (CN) from the certificate and extract the APEX (registered domain) from
it.

Usage: ./cn_from_cert.sh <ip> <port>

Default port is 443

Output:
"<ip>","<cn>","<apex>"
