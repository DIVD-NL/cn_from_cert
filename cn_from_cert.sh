#!/bin/bash
#set -x
if [[ "$2" == "" ]]; then
	port=443
else
	port=$2
fi
ip=$1

# Get cert
openssl s_client -connect $ip:$port 2>/dev/null </dev/null |  sed -ne '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p' > $ip:$port.crt

# get CN from IP
CN=$(timeout 2 openssl x509 -noout -subject -in $ip:$port.crt | sed 's#.*\=\s*##')
DOMAIN=$(./hostname_to_apex.py $CN)
echo "\"$ip\",\"$CN\",\"$DOMAIN\""

