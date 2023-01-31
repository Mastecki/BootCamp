# Ruby (nie Ruby-on-Rails) crash-course

Ruby to obiektowy język skryptowy, na którym zbudowany jest vagrant.

Obecnie są prace nad przepisaniem vagranta na golang, ale jak na razie idzie to opornie.

Wszystkie skrypty znajdujące się w tym folderze możecie odpalać lokalnie na linuxie, nie wiem jak na czystym (bez WSL) Windows, natomiast najwygodniejszą opcją będą onlinenowe interpretery (wystarczy przekleić kod):
1. https://onecompiler.com/ruby
1. https://runrb.io/

Polecam szczególnie 1.

Skrypty te są baaardzo krótkim crash-coursem z komentarzem. Omawiam tylko bare minimum które jest potrzebne do zrozumienia co się dzieje w Vagrantfile.
W [ostatnim skrypcie](./04_mock_vagrant.rb) możecie zobaczyć namiastkę jak działa Vagrantfile: co jest funkcją, jak działa logika ustawiania tego wszystkiego, etc.

Przyjąłem konwencję, że wszystkie komentarze, nazwy zmiennych, klas, oraz funkcji które sami definiujemy, są po Polsku. Jest to zrobione po to, żebyście jasno widzieli gdzie kończy się sam Ruby, a gdzie zaczyna się nasz przykładowy kod.

## Skrypty
| Skrypt | Cel | 
|--|---------------|
| [01_zmienne.rb](./01_zmienne.rb) | Podstawy języka, komentarze, pętle for, for-each, if-else, zmienne środowiskowe, wielolinijkowe zmienne |
| [02_funkcje.rb](./02_funkcje.rb) | Jak działają funkcje, jak je wywołujemy, return vs yield, zwracanie wielu zmiennych |
| [03_klasy.rb](./03_klasy.rb) | Ruby jest obiektowe, więc 101 obiektów, klas |
| [04_mock_vagrant.rb](./04_mock_vagrant.rb) | Jak moglibyśmy "zamokować" vagranta. Możecie śmiało wkleić ten skrypt do onlinenowych interpreterów, nie uruchamia (ani nie wymaga) on prawdziwego vagranta. Oczywiście jest to gigantyczne uproszczenie, ale dzięki temu powinniście zobaczyć, że Vagrantfile to nic innego niż plik ze skryptem ruby, który produkuje obiekt z konfiguracją na podstawie której vagrant działa. |
