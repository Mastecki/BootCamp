import re

phoneregex = re.compile(r'\d\d\d-\d\d\d-\d\d\d\d')
phoneregex2 = re.compile(r'''
                             (\d\d\d-
                             \d\d\d-
                             \d\d\d\d)''', re.VERBOSE)  # .re.VERBOSE allows to add comments and newlines etc.
print(phoneregex.findall('call me 415-555-1234 tomorrow, or at 415-555-2345 later today'))
print(phoneregex2.findall('call me 415-555-1234 tomorrow, or at 415-555-2345 later today'))
# .findall() doesn't need to be in var, .search() does

print(phoneregex.sub('REDACTED', 'call me 415-555-1234 tomorrow, or at 415-555-2345 later today'))
# .sub() finds patterns from .compile() and replaces them with the fist expression
