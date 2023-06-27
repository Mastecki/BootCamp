import os

print(os.path.join('folder1', 'folder2', 'folder3'))  # creates a path from strings
print(os.sep)  # separator dla danego os (/ dla mac/lin, \ dla win)
print(os.getcwd())  # cwd == pwd

# os.chdir('xxxc')  # changes cwd / cd x
# os.path.exists('path')  # True or False
# os.path.isfile('file')  # True or False
# os.path.isdir('path')  # True or False
# os.makedirs('dir')  # Makes new directories

print(os.path.abspath('spam.jpg'))  # prints absolute path of the 'file'

hellofile = open('hello.txt')  # reads a file from pwd, can be used with absolute pasth as well
#                                , 'a' appends to the file, , 'w' owerwrites the file
content = hellofile.readlines()  # returns a list of strings
print(content)
hellofile.close()

hellofile = open('hello.txt')  # reads a file from pwd, can be used with absolute pasth as well
content = hellofile.read()  # returns one line of strings
print(content)
hellofile.close()

