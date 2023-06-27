# This is a guess the number game

import random
import sys

print('Hello. What is your name?')
name = input()

print('Well hello, ' + name + '. I am thinking of a number between 1 and 20, try to guess it.')
secretNumber = random.randint(1, 20)

try:  
    for guessesTaken in range(1, 7):
        guess = int(input())
        if 0 < guess < secretNumber:
            print('Your guess is too low')
        elif 21 > guess > secretNumber:
            print('Your guess is too high')
        elif guess < 1 or guess > 20:
            print('Number outside of range, try again')
        else:
            break  # This condition is for the correct guess
except ValueError:
    print('You did not type a number, exiting')
    sys.exit()

if guess == secretNumber:
    print('Good job, ' + name + '! You guessed correctly in ' + str(guessesTaken) + ' guesses!')
else:
    print('Nope, the number I was thinking of was ' + str(secretNumber) + '.')
