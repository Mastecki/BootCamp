supplies = ['pins', 'pens','pens','pens','pens','pens','pens','pens','penns']
print(supplies[0])  # pierwszy item z listy
print(supplies[0:9]) # zakres 1-8 ! zawsze liczone od zera, bez ostatniego itemu z deklaracji
print(supplies[-1])  # minus listuje itemy od końca

spam = [['cat', 'dog'], ['mouse', 'doggo']]  # lista dwóch list
print(spam)
print(spam[0][0])  # pierwsz lista pierwszy item
print(spam[1][0])  # druga listwa pierwszy item (najpierw numer listy, potem numer itemu z listy)

spam[0][0] = 'marek'  # podmienia item [0][0] na nowy
print(spam)

gram = spam
gram[0][1] = 'srarek'  # podmiana w innej zmiennej zmienia całą tabelę,
                       # spam i gram to odniesienia do tabeli, zmienne są tylko odnośnikami do tabeli w pamięci
print(spam)
print(gram)

def eggs(someParam):  # adds 'hello' to the list, doesn't delete with lists
    someParam.append('hello')

milk = [1, 2, 3]
eggs(milk)
eggs(spam)
print(milk)
print(spam)

import copy
pens = copy.deepcopy(supplies)  # creates a separate copy of the list, not a reference so it can be edited separately
eggs(pens)
print(supplies)
print(pens)

# \ - ignore indentation of the next line
