#!/bin/sh
set -ex;
# ten skrypt powinien byc odpalony na manager (hivequeen)
# dopiero po zakonczeniu provisioningu na wszystkich worker (drone)
cd /sync;
# wypisz wszystkie node (managers + workers) w swarmie
docker node ls;
# stack to w docker swarm zestaw wielu service
# service to w docker swarm zestaw wielu container
# pojecie service istnieje w docker compose, ale jest czyms innym niz w docker swarm
# pojecie service nie istnieje w samym docker
# pojecie stack nie istnieje w docker compose ani w samym docker
# wypisz wszystkie stacki (bedzie ich 0)
docker stack ls;
# stworz nowy stack, na podstawie pliku ./compose.yml
# ten nowy stack bedzie mial nazwe "hive"
docker stack deploy \
    --compose-file ./compose.yml \
    hive \
;
# czekaj az stack wstanie
# czas czekania organoleptycznie dobrany
sleep 13;

# wypisz wszystkie stacki (bedzie ich 1, "hive")
docker stack ls;
# dla stacka "hive", wypisz wszystkie dzialajace serwisy
docker stack services hive;
# dla stacka "hive", wypisz wszystkie dzialajace kontenery
docker stack ps hive;
# wypisz wszystkie serwisy (bedzie ich 1, "hive-hello_world")
docker service ls;
# dla serwisu "hive_hello-world", wypisz wszystkie dzialajace kontenery
docker service ps hive_hello-world;

# wypisz wszystkie dzialajace kontenery na hivequeen
# bedzie ich 0
# czy wiesz czemu?
# hint: przeczytaj compose.yml
docker ps;

for i in $(seq 6); do
    echo "calling docker swarm service @ localhost:8080 ${i} time";
    timeout 5 curl localhost:8080;
done