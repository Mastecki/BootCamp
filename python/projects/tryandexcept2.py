print('How many cats do you have?')
numCats = input()
try:
    if int(numCats) >= 4:
        print('That is a lot of cats.')
    elif int(numCats) < 0:
        print('You cannot have negative amount of cats')
    else:
        print('That is not that many cats')
except ValueError: # doesn't have to type specific error, can look like "except:"
    print('You did not enter a number')
