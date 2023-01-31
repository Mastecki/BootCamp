

# Alpine

## Słownik ubuntu -> alpine

| Cel komendy | ubuntu        | alpine       | 
|--|---------------|--------------|
| Uaktualnij bazę pakietów | `apt update`  | `apk update` |
| Zainstaluj pakiet | `apt install ${pkg_name}` | `apk add ${pkg_name}`    |
| Dodaj istniejącego użytkownika do istniejącej grupy | `usermod -aG ${group} ${user}` | `addgroup ${group} ${user}` |
| Uruchom serwis | `systemctl start docker.service`| `rc-service docker start`|
| Dodaj serwis do "autostartu" | `systemctl enable docker.service` (warunki startu zależą od pliku configuracyjnego serwisu) | `rc-update add docker boot` (`boot` to grupa, która definiuje warunki startu) |

## Tipsy
1. Zamiast `apk update && apk add ${pkg_name}`, można użyć `apk --update add ${pkg_name}`
1. Lista pkg dostępnych jest na https://pkgs.alpinelinux.org/packages , oraz `apk list`
1. Jeśli potrzebujemy konkretnego programu, znamy jego nazwę, ale nie pakiet w którym jest on dostępny, z pomocą przychodzi https://pkgs.alpinelinux.org/contents
1. Jeśli nie chcemy by skrypt "wisiał" w nieskończoność, przydatna jest komenda [`timeout`](https://man7.org/linux/man-pages/man1/timeout.1.html)
1. [`set`](https://man7.org/linux/man-pages/man1/set.1p.html) jest bardzo przydatnym programem, który modyfikuje sposób działania interpretera shella
    1. w przypadku skryptów które są "ważne", warto dać `set -eu`
    1. natomiast `set -x` jest idealne do debugowania
    1. by wyłączyć którąś opcję seta, wystaczy dać `set +` poprzedzone opcją (np. `set +x`)