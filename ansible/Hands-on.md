# Projekt Ansible

Korzystając z konfiguracji Vagranta używanej podczas warsztatów:

Przygotuj:

- plik inventory (hosts)
- playbook / playbooki
- role*
- pliki ze zmiennymi

Tak, żeby:

### Wszystkie hosty:

- mają zaktualizowane paczki
- mają zainstalowane `git`, `docker`, `python`
- mają zainstalowane moduły pythonowe `docker` i `docker-compose`
- docker nie jest uruchamiany jako root

### Host 1:

- ma uruchomiony serwer Mealie (https://hay-kot.github.io/mealie/), który:
  - korzysta z bazy danych na hoście 2
- serwer Mealie uruchamia się automatycznie po restarcie hosta

### Host 2:

- ma uruchomiony serwer PostgreSQL (w dockerze lub bezpośrednio na hoście)
- serwer bazy danych uruchamia się automatycznie po restarcie hosta
- do połączenia z bazą danych używamy użytkownika z mocnym hasłem
- hasło nie jest zapisane _plaintextem_ nigdzie w naszym repozytorium z kodem ansible

## Dodatkowo:

- wykorzystaj role dostępne w Ansible Galaxy
  - stwórz plik requirements.txt lub requirements.yaml z wymaganymi rolami
- zadbaj o bezpieczeństwo hostów, upewnij się, że niemożliwe jest logowanie się po SSH hasłem, a tylko kluczem
  - a może jeszcze coś warto zrobić?

