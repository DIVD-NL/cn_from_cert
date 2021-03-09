#!/bin/env python
import tldextract
import sys


ext = tldextract.extract(sys.argv[1])
print("{}.{}".format(ext.domain, ext.suffix))
