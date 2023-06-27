import sys # wbudowany moduł
import pyperclip # 3rd party moduł
print('Hello')
pyperclip.copy('Hej cipcia') # wywołanie funkcji z modułu pyperclip
print(pyperclip.paste())
sys.exit() # po wykonaniu funkcji nie wykona się już nic później
print('Goodbye')

# pip install /name of module/ - need to install pip first
