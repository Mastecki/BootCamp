# Linux - zadania

## Zadanie 1 

> Praca z tekstem

1. Należy wyświetlić wszystkie wpisy z pliku `/etc/passwd` w formacie: `nazwa_użytkownika - katalog_domowy`, posortowane alfabetycznie po nazwie użytkownika

cut -d : -f 1,6 /etc/passwd
awk -F":" '{print $1 " - " $6}' /etc/passwd

2. Należy wyświetlić 5 najwiekszych plików wraz z ich rozmiarem znajdujacych sie w katalogu `/usr/bin`
   
du -sh /usr/bin/* | sort -n | tail -n5

3. Plik `SpisMiejscowosci.txt` zawiera miasta w Polsce na litere "Z", ale pojawily sie bledy i jest tam rowniez kilka miast na litere "W". Podaj ile jest takich miast

grep -c ^W SpisMiejscowosci.txt

4. Plik `SpisMiejscowosci.txt` powininien zawierac unikalne nazwy miast na litere "Z", jednak wkradl sie blad i "Zimno" wystepuje kilka razy. Podaj ile?
   Liczba 20 nie jest poprawna :)

cat SpisMiejscowosci.txt | grep -w Zimno | wc -l


## Zadanie 2

Pracujecie w duzej firmie ktorej wlasciciel ma 8 letniego wnuka ktoremu obiecal uruchomic serwera Minecraft'a w wersji Java.
Poprosil was o przygotowanie serwera na bazie Ubuntu ktory po starcie uruchomi Minecrafta na standardowym porcie `25565`. Aplikacja ma dzialac jako serwis systemd i uruchmiac sie automatycznie po starcie serwera.

> Tworzenie użytkowników i instalacja pakietow

1. Stworz dedykowanego uzytkownika "minecraft" z katalogiem domowym w `/opt/minecraft` i shellem `/bin/bash`

1. Zainstaluj dodatkowe oprogramownie - paczke `openjdk-17-jre-headless` oraz `net-tools`
	- jezeli system nie znajdzie openjdk to dodaj repozytorium `sudo add-apt-repository ppa:openjdk-r/ppa`

1. Sciagnij Minecraft Java 1.16.3 - https://launcher.mojang.com/v1/objects/f02f4473dbf152c23d7d484952121db0b36698cb/server.jar do katalogu domowego uzytkownika minecraft

1. Uruchom server minecrafta z uzytkownika minecraft aby sprawdzic czy dziala.

	- `java -Xms1G -Xmx3G  -jar server.jar nogui`

1. Popraw plik `eula.txt`

> Tworzenie konfiguracji systemd service

Dokumentacja: 
- https://www.freedesktop.org/software/systemd/man/systemd.service.html
- https://www.freedesktop.org/software/systemd/man/systemd.exec.html

1. Przygotuj plik `minecraft.service` w katalogu `/etc/systemd/system`
2. Powinien zawierac 3 sekcje, unit powinien startowac po` network.target`, uruchamiac komende `java -Xms1G -Xmx3G  -jar server.jar nogui` z uzytkownika `minecraft` z katalogu `/opt/minecraft`
W sekcji instalacji powinien miec `WantedBy=multi-user.target`
3. Uruchom serwis minecraft.service i sprawdz czy nasluchuje na porcie `25565`




