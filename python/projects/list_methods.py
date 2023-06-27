spam = ['hello', 'hi', 'hey', 'howdy']
print(spam.index('hello'))  # will return 0 as hello is the 0 index of the list
print(spam)
spam.append('welcome')  # add an item to the end of the list
print(spam)
spam.insert(1, 'chicken')  # adds an item into any position you want, moving rest to the right
print(spam)
spam.remove('chicken')  # removes an item from the list
print(spam)
del spam[0]  # removes an index from the list
print(spam)

ham = [76, 2, 5, 1, 13, -7, 23]
print(ham)
ham.sort()  # sorts the items in the list
print(ham)
ham.sort(reverse=True)  # sorts the items in the list, but reverse
print(ham)

dam = ['hello', 'hi', 'hey', 'howdy']
print(dam)
dam.sort()  # sorts the strings as well
print(dam)
