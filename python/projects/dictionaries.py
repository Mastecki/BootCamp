# Dictionary = key:value pair; dictionaries are unordered, order doesn't matter when comparing, uses {}

myCat = {'size': 'fat', 'colour': 'gray', 'disposition': 'loud'}
print('My cat is a ' + myCat['size'] + ' bastard.')

print(list(myCat.keys()))  # Prints as a list
print(list(myCat.values()))
print(list(myCat.items()))

for v in myCat.values():  # Prints values
    print(v)

for k, v in myCat.items():  # Prints keys and values
    print(k, v)

for i in myCat.items():  # Prints tuples (collection of objects separated by commas)
    print(i)

print(myCat.get('size', 0))  # Searches for a 'size' key, returns the value of it when found, returns 0 when not


# Adding entries to the dictionary, previously not in it
if 'age' not in myCat:
    myCat['age'] = '8'

# OR

myCat.setdefault('age', '8')


# List of dictionaries is called a data structure

cat = {'name': 'kupal', 'size': 'fat', 'colour': 'gray', 'disposition': 'loud'}
allcats = []
allcats.append({'name': 'kupal', 'size': 'fat', 'colour': 'gray', 'disposition': 'loud'})
allcats.append({'name': 'dupal', 'size': 'fat', 'colour': 'gray', 'disposition': 'loud'})
allcats.append({'name': 'siupal', 'size': 'fat', 'colour': 'gray', 'disposition': 'loud'})
allcats.append({'name': 'srupal', 'size': 'fat', 'colour': 'gray', 'disposition': 'loud'})

print(allcats)
