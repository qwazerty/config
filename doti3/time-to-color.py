#! /usr/bin/python

from time import gmtime, strftime
h = int(strftime("%H", gmtime()))
m = int(strftime("%M", gmtime()))
s = int(strftime("%S", gmtime()))

if (h >= 12):
    h = h - 12
else:
    h = 12 - h

if (m >= 30):
    m = 60 - m

if (s >= 30):
    s = 60 - s

h = 15 + 20 * h
m = 8.5 * m
s = 8.5 * s

h = "%x" % h
m = "%x" % m
s = "%x" % s

print (h + m + s)
