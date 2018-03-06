#!/usr/bin/env python
flines = []
vlines = []
nlines =[]
with open('f.txt') as f:
    flines = f.readlines()
with open('v.txt') as v:
    vlines = v.readlines()
with open('n.txt') as n:
    nlines = n.readlines()

for fl in flines:
    for vl in vlines:
        for nl in nlines:
            print 's' + fl.rstrip() + vl.rstrip() + nl.rstrip()
