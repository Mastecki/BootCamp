# Change the contents of the string, not the same as with lists

spam = 'Marek jest gruby mocno'
cham = spam[:10] + ' w chuj ' + spam[11:22]

print(spam)
print(cham)
