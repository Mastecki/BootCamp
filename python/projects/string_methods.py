spam = 'hello world'
print(spam)
print(spam.upper())  # only shows the upper, doesn't change the content
# to change the content, you need to set new value

if spam.islower():  # checks if spam is lowercase, can be done with spam.isupper()
    print(spam + ' is all in lowercase')
else:
    print(spam + ' is not in lowercase')

print('type yes')
answer = input()
if answer.lower() == 'yes':  # change answer to lower to ensure no errors
    print('you answered yes')
else:
    print('type yes you doughnut')

print('hello'.upper())


# other types of string checks
# spam.issalpha()
# spam.isalnum()
# spam.isdecimal()
# spam.isspace()
# spam.istitle()

# only shows the upper, doesn't change the content
print(['cats', ' rats', ' bats'])
print(','.join(['cats', ' rats', ' bats']))  # prints list as string, joined with ,
print('hello world'.split())  # prints table of split string, by default splits on whitespace
print('hello'.ljust(10))
print('hello'.ljust(10, '*'))
print('hello'.rjust(10))
print('hello'.center(10, '='))
print('hello   '.strip())  # strips spaces, same as above
print('hello   '.lstrip())  # strips spaces
print('hello   '.rstrip())  # strips spaces
print('hello   '.replace('e', 'o'))  # replaces x with y

name = 'Alice'
place = 'Street'
time = '6 pm'
food = 'cheese'

print('hello ' + name + ' party on the ' + place + ' at ' + time + ' bring ' + food + '.')

# OR

print('hello %s party on the %s at %s bring %s.' % (name, place, time, food))  # replaces %s with every variable in line
