# Zadania:

Kod aplikacji: https://github.com/jpetazzo/wordsmith

## Budowanie obrazów
### Zadanie 1 - Zbuduj aplikacje napisaną w Go (web)
- Użyj obrazów: `golang`, `debian`
- Zastosuj najlepsze dostępne praktyki (parametryzacja, multi-stage, itd.)
- Na podstawie kodu aplikacji ustal port do wystawienia

PS Skorzystaj z docker hub, żeby ustalić najnowsze wersje obrazów bez używania tagu latest

## Zadanie 2 - Zbuduj aplikacje napisaną w Javie (`words`)

- Użyj obrazów `eclipse-temurin` oraz `maven` z Javą w wersji 8
- Ustal tagi na podstawie Docker Hub
- Zastosuj najlepsze dostępne praktyki przy budowie obrazu

## Zadanie 3 - Napisz `compose.yaml`
- umieścisz powyższe serwisy
- dodaj też Postgresa
- spraw żeby wszystko ze sobą "rozmawiało" oraz ustaw schemat bazy zgodnie z zawartością katalogu `db`
- ustaw volume, aby dane w Postgresie nie znikały w czasie restartów
- dodaj serwis "pomocniczy" który ustawi schemat bazy danych

## Zadanie 4 - Dodaj Nginx proxy tak by było w stanie proxować aplikacje `web`
- skorzystaj z oficjalnego obrazu `nginx`
- użyj przykładów dla `proxy_pass` z internetu
- umieść aplikacje `web` w location: `/`

## Zadanie 5 - Podziel serwisy compose na sieci: `private-backend` i `public-frontend`
- w sieci publicznej powinien znajdować się nginx
- w sieci prywatnej reszta serwisów

## [DODATKOWE] Zadanie 6 - Przygotuj środowisko developerskie do aplikacji `web` oraz `words`

https://docs.docker.com/desktop/dev-environments/
- stwórz `compose-dev.yaml` bazujący na `compose.yaml`
- zmodyfikuj stage obrazów by dodać stage `dev-envs` dostosuj `compose-dev.yaml` do użycia tego stage (przeanalizuj przykłady z repozytorium `docker/awesome-compose`)
- korzystając z Docker Desktop uruchom Development Environment

Przydatne komendy:
`docker build` - budowanie obrazu
`docker run` - uruchamianie kontenera
`docker exec` - uruchamianie dodatkowego procesu w kontenerze
`docker ps` - wyświetlenie kontenerów
`docker compose up` - uruchomienie stacku compose lub wskazanych serwisów
`docker compose down` - wyłączenie i usunięcie kontenerów
`telnet <HOSTNAME> <PORT>` - komenda pomocna do testu portu TCP
`nslookup <HOSTNAME>` - testowanie rozwiązywania nazwy hosta w DNS

Pamiętaj, że każda z komend dockerowych posiada opcje `--help` która może być pomocna

`compose.yaml` i `Dockerfile` opis plików dostępny jest w dokumentacji Dockera (eg. Dockerfile reference)
