import re

phoneregex = re.compile(r'(\d\d\d)-(\d\d\d)-(\d\d\d\d)')  # () creates groups of objects found, to find special characters, need to use \
phoneregex2 = re.compile(r'(\d\d\d-)?(\d\d\d)-(\d\d\d\d)')  # searches for a number with or without first 3 didigts
phoneregex3 = re.compile(r'((\d\d\d-)?(\d\d\d)-(\d\d\d\d)(,)?){2}')  # {} - looks for {x} repetitions
mo = phoneregex.search('call me 415-555-1234 tomorrow, or at 415-555-2345 later today')
mo2 = phoneregex2.search('call me 415-555-1234 tomorrow, or at 415-555-2345 later today')
mo3 = phoneregex3.search('call me 415-555-1234,415-555-2345 later today')
print(mo.group(1))
print(mo.group(3))
print(mo2.group())
print(mo3.group())

batregex = re.compile(r'bat(man|mobile|copter|bat)')  # | to match one of many possible groups
batregex2 = re.compile(r'bat(wo)?man')  # ? - (wo) can appear 0 or 1 times
batregex3 = re.compile(r'bat(wo)*man')  # * - (wo) can appear 0 or x times
batregex4 = re.compile(r'bat(wo)+man')  # + - (wo) can appear 1 or more times
bo = batregex.search('batmobile lost a wheel')
bo2 = batregex2.search('the adventures of batwoman')
bo3 = batregex3.search('the adventures of batwowowoman')
bo4 = batregex4.search('the adventures of batwowowoman')

print(bo.group())
print(bo2.group())
print(bo3.group())
print(bo4.group())

regex = re.compile(r'\* \? \+')  # searches for specific special signs used before
reg = regex.search('* ? +')
print(reg.group())

haregex = re.compile(r'(Ha){3}')  #searches for a string that appears {x} times
haregex2 = re.compile(r'(Ha){3,5}')  #searches for a string that appears between {x,y} times, prints max number (greedy)
haregex3 = re.compile(r'(Ha){3,5}?')  #searches for a string that appears between {x,y} times, prints min number (non-greedy)
ha = haregex.search('He said "HaHaHa"')
ha2 = haregex2.search('He said "HaHaHaHaHaHaHa"')
ha3 = haregex3.search('He said "HaHaHaHaHaHaHa"')  
print(ha.group())
print(ha2.group())
print(ha3.group())

