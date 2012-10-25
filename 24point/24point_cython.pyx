#!/usr/bin/python
# -*- coding: utf-8 -*-
'''
@date: 2012-05-10
@author: shell.xu
'''
from itertools import combinations

cdef class opt(object):
    cdef object name
    cdef object func
    cdef public char exchangable
    def __init__(self, name, func, ex=1):
        self.name, self.func, self.exchangable = name, func, ex
    def __str__(self): return self.name
    def __call__(self, l, r): return self.func(l, r)
    cdef fmt(self, l, r):
        return '(%s %s %s)' % (fmt_exp(l), str(self), fmt_exp(r))

def fmt_exp(e): return e[0].fmt(e[1], e[2]) if isinstance(e, tuple) else str(e)

def chkexp(target, pr=False):
    def do_exp(e, v):
        if abs(v - target) < 0.001:
            if pr: print fmt_exp(e), '=', target
    return do_exp

cdef iter_all_exp(f, ops, ns, e, v):
    cdef int r
    if not ns: return f(e, v)
    for r in set(ns):
        ns.remove(r)
        for op in ops:
            iter_all_exp(f, ops, ns, (op, e, r), op(v, r))
            if not op.exchangable:
                iter_all_exp(f, ops, ns, (op, r, e), op(r, v))
        ns.append(r)

opts = [
    opt('+', lambda x, y: x+y),
    opt('-', lambda x, y: x-y, 0),
    opt('*', lambda x, y: x*y),
    opt('/', lambda x, y: float(x)/y, 0),]

if __name__ == '__main__':
    for i in xrange(100):
        ns = [3, 4, 6, 8]
        for r in set(ns):
            ns.remove(r)
            iter_all_exp(chkexp(24), opts, ns, r, r)
            ns.append(r)
