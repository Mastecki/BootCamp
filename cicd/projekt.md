# PROJEKT CICD

Na podstawie apki python'a stwórz kompletny pipeline CI/CD, w którym:
- uruchomione zostaną unit testy aplikacji
- wynik testów będzie dostępny w Jenkinsie
- Następnie, po udanych unit testach:
- zbuduje obraz aplikacji z zainstalowanymi zależnościami
- artefaktem będzie obraz opublikowany na DockerHub
- Następnie zasymuluje wdrożenie - uruchomi kontener w środowisku DEV, zatrzyma pipeline do czasu weryfikacji, że aplikacja działa, a po potwierdzeniu wdroży aplikację na środowisko PRODUCTION. 
(Do zasymulowania uruchomienia kontenera na środowiskach można wykorzystać np. różne porty)
- na koniec wyczyści workspace

Dodatkowo:
- zmiana w repozytorium, w katalogu python-app, automatycznie uruchamia pipeline
- wszystkie zmiany będą wywoływały testy aplikacji i deployment do DEV, lecz jedynie zmiany na branchu master (main) będą powodowały wdrożenie kontenera na Production
- w przypadku niepowodzenia jakiegokolwiek kroku zostanie wysłane powiadomienie (np. email)
