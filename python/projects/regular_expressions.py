# is the text a us phone number?

def isphonenumber(text):
    if len(text) != 12:
        return False  # not phone number sized
    for i in range(0, 3):
        if not text[i].isdecimal():
            return False  # no area code
    if text[3] != '-':
        return False  # missing dash
    for i in range(4, 7):
        if not text[i].isdecimal():
            return False  # no first 3 digits
    if text[7] != '-':
        return False  # missing second dash
    for i in range(8, 12):
        if not text[i].isdecimal():
            return False  # no last 4 digits
    return True

# check for a phone number in a text using previous function

message = 'call me 415-555-1234 tomorrow, or at 415-555-2345 later today'
foundnumber = False
for i in range(len(message)):
    chunk = message[i:i+12]
    if isphonenumber(chunk):
        print('phone number found: ' + chunk)
        foundnumber = True
if not foundnumber:
    print('could not find any phone numbers')

# OR

import re  # regular expressions

message2 = 'call me 415-555-1234 tomorrow, or at 415-555-2345 later today'
phonenumregex = re.compile(r'\d\d\d-\d\d\d-\d\d\d\d')  # r - raw string; \d - searches for decimal digits, see documentation
mo = phonenumregex.search(message2)
print(mo.group())
# OR
print(phonenumregex.findall(message2))
