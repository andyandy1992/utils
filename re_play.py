import re

def re_show(pat, s):
    """ Returns the string(s) in 's' that are matched by the RegEx defined in 'pat' """
    print re.compile(pat, re.M).sub("{\g<0>}", s.rstrip()),'\n'

def re_new(pat, rep, s):
    print re.sub(pat, '{'+rep+'}', s)
