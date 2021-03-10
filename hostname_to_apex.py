#!/bin/env python
import tldextract
import sys

"""
>>> ext = tldextract.extract('http://forums.bbc.co.uk')
>>> (ext.subdomain, ext.domain, ext.suffix)
('forums', 'bbc', 'co.uk')
>>> # rejoin subdomain and domain
>>> '.'.join(ext[:2])
'forums.bbc'
>>> # a common alias
>>> ext.registered_domain
'bbc.co.uk'
"""

ext = tldextract.extract(sys.argv[1])
if ext.suffix and ext.domain:
	print("{}.{}".format(ext.domain, ext.suffix))
else:	
	print()
