# Wszystko razem (Podsumowanie)

Plik [Vagrantfile](./Vagrantfile) w tym folderze został napisany przeze mnie ręcznie.

## Debug (korzystajcie, niekoniecznie czytajcie)

Na samym początku jest moduł `CustomVagrantDebug`, który służy tylko i wyłącznie wypisaniu wam na ekran wyniku parsowania Vagrantfile, i tego jaki obiekt konfiguracyjny poleci dalej do vagranta. Jeśli skrypt "znajdzie" zmienną środowiskową `DEBUG` (niezależnie od jej wartości) to przy dowolnym poleceniu vagranta korzystającym z Vagrantfile (np `vagrant up`), zamiast wykonać odpowiednie działanie vagranta, wypisze konfigurację (bardzo długą) na ekran, i się "wywali".

Dzięki temu, pisząc Vagrantfile, jeśli nie jesteście pewni jakichś domyślnych wartości, chcecie upewnić się czy aby na pewno dostaniecie tego czego chcecie, albo po prostu checie podejrzeć co się dzieje pod maską, macie na to wygodny sposób (polecam `./debug.sh | grep 128` żeby zobaczyć, jak vagrantowy provider VirtualBoxa przekazuje do VirtualBoxa informację ile RAMu zaalokować).

Jeszcze wygodniejsze jest odpalenie [skryptu debug.sh](./debug.sh), który upewni się że zmienna `DEBUG` jest ustawiona na czas działania polecenia vagranta.

Lektura [skryptu](./debug.sh) czy modułu `CustomVagrantDebug` **jest całkowicie dla chętnych**, wychodzi poza zakres szkolenia, mogę coś wytłumaczyć ale nie będziecie potrzebowali tej wiedzy żeby korzystać z vagranta.

## Część Główna

Poniżej `CustomVagrantDebug` jest ta część `Vagrantfile` z którą będziecie obcować na codzień. Jest to prosta konfiguracja, bez wielu dodatkowych opcji.
Przypominam, że w [Ruby funkcje można wykonywać](../03_ruby/02_funkcje.rb) na 2 sposby:
1. ```ruby
    foo(bar, baz)
    ```
1. ```ruby
    foo bar, baz
    ```
gdzie `foo` to nazwa funkcji, a `bar` i `baz` to argumenty do jej wywołania.

Przypominam o tym, jako że zastosowałem w tym pliku styl 1. (bardziej znajomy programistom innych języków, jak C, C#/Java, python, javascript, etc.), natomiast tak `vagrant init` jak i zdecydowana większość plików `Vagrantfile` jakie spotkacie stosują styl 2. Powodem jest to, że styl 2. jest związany ze starym Ruby i ogólnie światem skryptowania, a zdecydowana większość ludzi piszących `Vagrantfile` nie zna Ruby a pracuje metodą Kopiego-Pejsta.

## `provision_script`
Dla czytelności umieściłem shellową część tworzenia VM w osobnej zmiennej `provision_script`, korzystając z here-docs omawianych w [poprzedniej części](../03_ruby/01_zmienne.rb). Oczywiście możecie wrzucić zawartość do pliku `provision.sh` a w `node.vm.provision` zamiast z `inline: provision_script` użyć `file: ./provision.sh`.

## `./sync`

Jak dostaniecie error:
```
Bringing machine 'box-1' up with 'virtualbox' provider...
There are errors in the configuration of this machine. Please fix
the following errors and try again:

vm:
* The host path of the shared folder is missing: ./sync
```

Wynika to z tego, że ścieżka do synca musi istnieć po stronie hosta (po stronie guesta jeśli nie istnieje zostanie stworzona). Vagrant jej nie stworzy. Jest to też opisane w samym Vagrantfile jako komentarz.

`git` nie pozwala na dodawanie pustych folderów do repo, tak więć musiałbym cos "wsadzić" do `./sync` (choćby pusty plik), żebyście nie musieli tego robić ręcznie.

Ale będzie to dobry test na Uważnego Czytacza :)

## Niezgodność wersji

Testowałem to na Windowsie z vagrantem w wersji `2.3.4`, oraz z Ruby w wersjach `2.5` i `2.3`. Istnieje taka możliwość, że jeśli korzystacie z o wiele starszej / nowszej wersji coś może nie zadziałać tak jak powinno.

Proszę wtedy o kontakt!