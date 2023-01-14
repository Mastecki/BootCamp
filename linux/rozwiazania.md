# Linux - rozwiazania zadan

## Zadanie 1

1.

    cat /etc/passwd | sort | awk -F: '{print($1" - "$6)}'

2.

     du -sh * | sort -h | tail -n5

3.

    cat SpisMiejscowosci.txt | grep -c ^W

4.

    grep -cw Zimno SpisMiejscowosci.txt
    cat SpisMiejscowosci.txt | grep -w Zimno | wc -l

## Zadanie 2

### Dodanie repozytorium z openjdk

    sudo add-apt-repository ppa:openjdk-r/ppa

### Instalacja paczek

    sudo apt install -y openjdk-17-jre-headless
    sudo apt install net-tools

#### Sprawdzanie czy cos nasluchuje na porcie 25565

    netstat -na | grep LISTEN | grep 25565

### Dodanie uzytkownika i sciagniecie binarki minecraft

    sudo useradd -s /bin/bash -m -d /opt/minecraft minecraft
    sudo su - minecraft
    curl -O https://launcher.mojang.com/v1/objects/f02f4473dbf152c23d7d484952121db0b36698cb/server.jar

### Testowe uruchomienie (prawdopodobnie zakonczy sie bledem ze wzgledy na nie zaakceptowanie EULA)

    java -Xms1024M -Xmx1024M  -jar server.jar nogui
    sed -i 's/eula=false/eula=true/' /opt/minecraft/eula.txt

### Stworzenie serwisu

    sudo su - 
    cd /etc/systemd/system
    
    cat > minecraft.service <<EOL
    [Unit]
    Description=Start Minecraft

    [Service]
    Type=simple
    User=minecraft
    WorkingDirectory=/opt/minecraft
    ExecStart=java -Xms1024M -Xmx1024M  -jar server.jar nogui
    ExecStop=pkill java
    StandardOutput=journal

    [Install]
    WantedBy=multi-user.target
    EOL

### Wlaczenie serwisu - autostart

    systemctl enable minecraft.service

### Uruchomienie serwisu

    systemctl start minecraft.service
    journalctl -u minecraft.service
    netstat -tulpn

Powinien byc widoczny proces java sluchajacy na porcie 25565