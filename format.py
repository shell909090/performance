#!/usr/bin/python
# -*- coding: utf-8 -*-
'''
@date: 2012-10-31
@author: shell.xu
'''
import re, sys, prettytable

data_re = re.compile("lang: (\w+), filesize: ([0-9\.]*) kB, runtime: ([0-9\.]*) s, memory: ([0-9\.]*) kB")
def main():
    x = prettytable.PrettyTable(["lang", "filesize", "runtime", "memory", "remark"])
    for line in sys.stdin:
        m = data_re.match(line)
        if m is None: continue
        r = m.groups()
        x.add_row([r[0],] + map(float, r[1:]) + ['',])
    print x.get_string(sortby="runtime")

if __name__ == '__main__': main()
