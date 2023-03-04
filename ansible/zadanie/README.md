## Zadanie

Stwórz playbook który przygotuje środowisko (web serwer) a następnie wdroży na nim stronę. Playbook powinien zawierać:
- instalację Nginx'a
- skonfigurowanie usługi web serwera by była uruchiana przy starcie systemu
- utworzenie katalogu na stronę
- wrdożenie strony (plik index.html)
- wdrożenie konfiguracji Nginx'a (plik web_config)
- wykonanie kopii zapasowej konfiguracji jeśli dokonywane są w niej zmiany - jedynie plik konfiguracyjny dotyczący strony
- walidację konfiguracji
- przywrócenie pliku konfiguracyjnego w przypadku jeśli walidacja się nie powiedzie
- usunięcie pliku kopii konfiguracji
- restart Nginx'a jeśli zostały dokonane zmiany pliku konfiguracyjnego
- playbook powinien status changed jedynie przy realnej zmianie środowiska


Po wykonaniu zastanów się nad tym jak dostosujesz playbook by tworzyć dwie strony jednocześnie przy czym druga miałaby być dostępna jako inny host wirtualny (np. todo-prod) oraz musiałyby wyświetlać nazwę wirtualnego hosta? Zakładamy że chcemy wykorzystać istniejące pliki bez dodawania nowych oraz starając się nie duplikować tasków

<details>
<summary>Podpowiedzi</summary>
<br>

Jakie elementy mogą być przydatne:
- moduł template (backup)
- moduł file
- block
- handler
- when
- zmienne

</details>