#! /usr/bin/python3

# Draws a tic tac toe board

board = {'top-l': 'X', 'top-m': ' ',
         'top-r': ' ', 'mid-l': ' ',
         'mid-m': ' ', 'mid-r': 'O', 'bot-l': ' ',
         'bot-m': ' ', 'bot-r': ' '}

def printboard(board):
    print(board['top-l'] + '|' + board['top-m'] + '|' + board['top-r'])
    print('-----')
    print(board['mid-l'] + '|' + board['mid-m'] + '|' + board['mid-r'])
    print('-----')
    print(board['bot-l'] + '|' + board['bot-m'] + '|' + board['bot-r'])

printboard(board)
