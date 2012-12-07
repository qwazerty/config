#! /usr/bin/python

from time import gmtime, strftime
h = int(strftime("%H", gmtime()))
m = int(strftime("%M", gmtime()))
s = int(strftime("%S", gmtime()))

if (h >= 12):
    h = 24 - h

if (m >= 30):
    m = 60 - m

if (s >= 30):
    s = 60 - s

h = 111 + 12 * h
m = 45 + 7 * m
s = 45 + 7 * s

h = "%x" % h
m = "%x" % m
s = "%x" % s

print (h + m + s)
