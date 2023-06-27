def spam():
    global eggs # makes local variable eggs replace value of global variable eggs
    eggs = 'hello' #local variable
    print(eggs)
eggs = 42 # global variable
spam()
print(eggs)

