/* @(#)test-c.c
 */

#include <stdio.h>

int fib(int n)
{
	if (n < 3) return 1;
	return fib(n-1) + fib(n-2);
}

int main(int argc, char *argv[])
{
	printf ("%d\n", fib(45));
	return 0;
}

