import shelve  # can store python values in a binary file

shelffile = shelve.open('mydata')
shelffile['cats'] = ['kot1', 'kot2', 'kot3', 'kot4']

print(shelffile['cats'])

shelffile.close()
