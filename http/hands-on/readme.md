## Wstęp

Wspierasz zespół tworzący prostą aplikację w node.js. Twoim zadaniem jest skonfigurować środowisko oparte na maszynie wirtualnej z systemem Linux. Apliakcja nie posiada zaimplementowanych mechanizmów bezpieczeństwa dlatego powinna działać za reverse proxy.

## Cel
Wdrożenie aplikacji node.js za nginx'em

## Środowisko

Vagrant to nakładka na VirtualBoxa (i inne hypervisory), pozwala na szybkie tworzenie maszyn wirtualnych i ich konfigurację. Możesz wykorzystać Vagrant w celu wykonania zadania, a po skończeniu usunąć całą maszynę wirtualną.

**Vagrant wspiera następujące wersje VirtualBoxa: 4.0.x, 4.1.x, 4.2.x, 4.3.x, 5.0.x, 5.1.x, 5.2.x, 6.0.x, i 6.1.x**

Tworzenie środowiska:
1. Utwórz katalog w profilu użytkownika - Vagrant działa w kontekście projektu-folderu
```
mkdir ~/linux_http
cd ~/linux_http
```
2. Utwórz maszynę Virtualną z Ubuntu
```
vagrant init ubuntu/focal64
vagrant up
```
3. Podłącz się do maszyny wirtualnej
```
vagrant ssh
```

Jeśli chcesz wyłączyć maszynę wirtualną użyj komendy `vagrant halt` w katalogu projektu

Po zakończeniu prac możesz usunąć maszynę wirtualną i katalog projektu
```
cd ~/linux_http
vagrant destroy
cd ..
rm -rf linux_http
```

## Zadanie

1. Zaktualizuj pakiety na serwerze
2. Zainstaluj node.js (18.x)
3. Utwórz użytkownika todo
4. Przełącz się na użytkownika todo
5. Sklonuj aplikację https://github.com/msl0/todos-fastify-sqlite.git. Uruchom i przetestuj działanie
6. Skonfiguruj aplikację jako usługę. Włącz uruchamianie przy starcie systemu. Sprawdź logi usługi
7. Zainstaluj nginx
8. Skonfiguruj nginx jako reverse proxy dla aplikacji todo tak by aplikacja była dostepna pod osobną domeną
9. Sprawdź czy serwer nginx wysyła swoją wersję w odpowiedzi, jeśli tak to wyłącz to.
10. Skonfiguruj limit żądań POST
12. Włącz uwierzytelnianie

## Dodatkowe

- Przygotuj skrypt wykonujący wdrożenie aplikacji
- Skonfiguruj HTTPS
- Skonfiguruj nadpisywanie błędów
- Co jeszcze można by poprawić?
