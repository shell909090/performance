#!/usr/bin/python
# -*- coding: utf-8 -*-
'''
@date: 2012-10-26
@author: shell.xu
'''
import os, sys

def main():
    l = []
    with open(sys.argv[1]) as fi:
        for line in fi:
            f = line.strip().split()
            l.append((int(f[0]), int(f[1])))
    print 'done'
    l.sort(key=lambda x: x[1])

if __name__ == '__main__': main()
