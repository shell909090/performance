#!/usr/bin/python
# -*- coding: utf-8 -*-
'''
@date: 2012-10-25
@author: shell.xu
'''
import re, sys

reline = re.compile('(\d+) (\d+)')
def main():
    with open('mnt/data.txt', 'r') as fi:
        for line in fi: reline.match(line).groups()

if __name__ == '__main__': main()
