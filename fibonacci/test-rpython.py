def target(drv, args):
    return main, None

def main(argv):
    print fib(45)
    return 0

def fib(n):
    if n < 3: return 1
    return fib(n-1) + fib(n-2)
