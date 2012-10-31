#!/usr/bin/python
# -*- coding: utf-8 -*-
'''
@date: 2012-10-26
@author: shell.xu
'''
import sys

with open(sys.argv[1]) as fi:
    l = sorted(
        (map(int, line.strip().split()) for line in fi),
        key=lambda x: x[1])
