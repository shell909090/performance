#!/usr/bin/python
# -*- coding: utf-8 -*-
'''
@date: 2012-10-26
@author: shell.xu
'''
import sys

def main():
    with open(sys.argv[1]) as fi:
        l = [tuple(map(int, line.strip().split())) for line in fi]
    l = sorted(l, key=lambda x: x[1])


if __name__ == '__main__':
    main()
