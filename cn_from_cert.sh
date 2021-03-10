#!/bin/bash
#set -x
if [[ "$2" == "" ]]; then
	port=443
else
	port=$2
fi
ip=$1
mkdir -p crts
# Get cert
timeout 2 openssl s_client -connect $ip:$port 2>/dev/null </dev/null |  sed -ne '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p' > crts/$ip:$port.crt

if [[ -e crts/$ip:$port.crt ]]; then 
	# get CN from IP
	CN=$( openssl x509 -noout -subject -in crts/$ip:$port.crt | sed 's#.*\=\s*##')
	if [[ "$CN" == "" ]]; then 
		DOMAIN=""
	else
		DOMAIN=$(./hostname_to_apex.py $CN)
	fi
	echo "\"$ip\",\"$CN\",\"$DOMAIN\""
fi

