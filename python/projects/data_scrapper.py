#! /usr/bin/python3

import pyperclip, re, pprint

# Create a regex for phone numbers
phoneregex = re.compile(r'''
# 415-000-0000, 555-0000, (415) 555-0000, 555-0000 ext 12345, ext. 12345, x12345
(
((\d\d\d)|(\(\d\d\d\)))?    # area code (optional)
(\s|-)  # first separator
\d\d\d  # first 3 digits
-  # separator
\d\d\d\d  # last 4 digits
(((ext(\.)?\s)|x)  # extension word-part (optional)
(\d{2,5}))?  # extension number-part
)  # whole group is to list tuples, then it will be converted into a new group to list only numbers from them
''', re.VERBOSE)

# Create a regex for email addresses
emailregex = re.compile(r'''
# some.+_thing@some.+_thing.com

[a-zA-Z0-9_.+]+  # name part
@  # @ symbol
[a-zA-Z0-9_.+]+  # domain part

''', re.VERBOSE)

# Get the text off the clipboard
text = pyperclip.paste()

# Extract the email/phone from this text
extractedphone = phoneregex.findall(text)
extractedemail = emailregex.findall(text)

allphonenumbers = []
for phonenumber in extractedphone:
    allphonenumbers.append(phonenumber[0])

# Copy the extracted email/phone to the clipboard
results = '\n'.join(allphonenumbers) + '\n' + '\n'.join(extractedemail)
pyperclip.copy(results)
