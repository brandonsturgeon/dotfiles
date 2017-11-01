#! /usr/bin/python

import json
import sys
import os

args = sys.argv
filename = args[1]

print "Pretty printing: {}".format(filename)

with open(filename, 'r') as json_file:
    json_file = json.load(json_file)

print json.dumps(json_file, indent=4, sort_keys=True)
