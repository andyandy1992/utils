#!/usr/bin/python

# A list of useful math functions
import math
import random #random.uniform(0,1), random.choice(list(self.table_prob))
from decimal import *

def gcd(a,b):
    """ Return the greatest common divisor 
    E.g. gcd(8,12)=4
    """
    if (a % b == 0):
        return b
    else:
        return gcd(b, a % b)

def lcm(a,b):
    """ Return the lowest common multiple
    E.g. lcm(5,2)=10
    """
    return a*b / gcd(a,b)

def factorial(n):
    """ Return the factorial of a natural number n """
    f = math.factorial
    return f(n)

def power(n,r):
    """ Return n^r """
    return n**r

def comb(n, r):
    """ Return the combination of n and r (i.e. the number of ways for positioning r cards within a total of
    n cards (where order doesn't matter). """
    f = math.factorial
    return f(n) / (f(r) * f(n-r))

def perm(n, r):
    """ Return the permutation of n and r (i.e. the number of ways for positioning r cards within a total of
    n cards (where order does matter)). """
    f = math.factorial
    return f(n) / f(n-r)

def harmonic_series(n):
    """ Return the sum of 1/1 + 1/2 + ... + 1/n """
    sum = 0
    for i in range(1,n+1):
        sum += 1.0/i
    return sum

def prob2odds(p):
    """ Return the odds for a given probability p """
    # Note: in the case of the usual game, we do not have to handle impossible events (e.g if a horse cannot win), and so this equation will never result in
    #       divion by zero.
    return (1-p) / p

def round_to(p, precision=0.05):
    """ Return a given number p rounded to the nearest 'precision' """
    correction = 0.5 if p >= 0 else -0.5 # so int (i.e. floor rounds to correct)
    return int( Decimal(p) / Decimal(precision) + Decimal(correction) ) * precision
