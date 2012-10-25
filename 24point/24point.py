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

def eval_exp(e):
    if not isinstance(e, tuple): return e
    try: return e[0](eval_exp(e[1]), eval_exp(e[2]))
    except: return None

def fmt_exp(e): return e[0].fmt(e[1], e[2]) if isinstance(e, tuple) else str(e)
def print_exp(e): print fmt_exp(e), eval_exp(e)

def chkexp(target, pr=False):
    def do_exp(e):
        if abs(eval_exp(e) - target) < 0.001:
            if pr: print fmt_exp(e), '=', target
    return do_exp

def iter_all_exp(f, ops, ns, e=None):
    if not ns: return f(e)
    for r in set(ns):
        ns.remove(r)
        if e is None: iter_all_exp(f, ops, ns, r)
        else:
            for op in ops:
                iter_all_exp(f, ops, ns, (op, e, r))
                if not op.exchangable:
                    iter_all_exp(f, ops, ns, (op, r, e))
        ns.append(r)

opts = [
    opt('+', lambda x, y: x+y),
    opt('-', lambda x, y: x-y, False),
    opt('*', lambda x, y: x*y),
    opt('/', lambda x, y: float(x)/y, False),]

if __name__ == '__main__':
    for i in xrange(100):
        iter_all_exp(chkexp(24), opts, [3, 4, 6, 8])
