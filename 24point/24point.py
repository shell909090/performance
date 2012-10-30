#!/usr/bin/python
# -*- coding: utf-8 -*-
'''
@date: 2012-05-10
@author: shell.xu
'''
from itertools import combinations

class opt(object):
    def __init__(self, name, func, ex=True):
        self.name, self.func, self.exchangable = name, func, ex
    def __str__(self): return self.name
    def __call__(self, l, r): return self.func(l, r)
    def fmt(self, l, r):
        return '(%s %s %s)' % (fmt_exp(l), str(self), fmt_exp(r))

def fmt_exp(e): return e[0].fmt(e[1], e[2]) if isinstance(e, tuple) else str(e)

def chkexp(target, pr=False):
    def do_exp(e, v):
        if abs(v - target) < 0.001:
            if pr: print fmt_exp(e), '=', target
    return do_exp

def iter_all_exp(f, ops, ns, e, v):
    if not ns: return f(e, v)
    for r in set(ns):
        ns.remove(r)
        for op in ops:
            try: iter_all_exp(f, ops, ns, (op, e, r), op(v, r))
            except: continue
            if op.exchangable:
                try: iter_all_exp(f, ops, ns, (op, r, e), op(r, v))
                except: continue
        ns.append(r)

opts = [
    opt('+', lambda x, y: x+y),
    opt('-', lambda x, y: x-y, False),
    opt('*', lambda x, y: x*y),
    opt('/', lambda x, y: float(x)/y, False),]

if __name__ == '__main__':
    ns = [3, 4, 5, 6, 7, 8]
    for r in set(ns):
        ns.remove(r)
        iter_all_exp(chkexp(24), opts, ns, r, r)
        ns.append(r)
