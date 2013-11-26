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

h = 135 + 10 * h
m = 8.5 * m
s = 8.5 * s

h = "%.2x" % h
m = "%.2x" % m
s = "%.2x" % s

print (h + m + s)
