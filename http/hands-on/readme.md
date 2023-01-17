## Wstęp

Wspierasz zespół tworzący prostą aplikację w node.js. Twoim zadaniem jest skonfigurować środowisko oparte na maszynie wirtualnej z systemem Linux. Apliakcja nie posiada zaimplementowanych mechanizmów bezpieczeństwa dlatego powinna działać za reverse proxy.

## Cel
Wdrożenie aplikacji node.js za nginx'em

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
- Włącz uwierzytelnianie
- Co jeszcze można by poprawić?
