#!/usr/bin/python
# -*- coding: utf-8 -*-
cdef int fib(int n):
    if n < 3: return 1
    return fib(n-1) + fib(n-2)

print fib(45)
