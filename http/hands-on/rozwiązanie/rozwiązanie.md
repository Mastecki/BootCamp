## Wstęp

Wspierasz zespół tworzący prostą aplikację w node.js. Twoim zadaniem jest skonfigurować środowisko oparte na maszynie wirtualnej z systemem Linux. Apliakcja nie posiada zaimplementowanych mechanizmów bezpieczeństwa dlatego powinna działać za reverse proxy.

## Cel
Wdrożenie aplikacji node.js za nginx'em

## Zadanie

1. Zaktualizuj pakiety na serwerze
```
sudo apt update
sudo apt upgrade
```
2. Zainstaluj node.js (18.x)
```
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash - && sudo apt-get install -y nodejs
```
3. Utwórz użytkownika todo
```
sudo adduser todo
```
4. Przełącz się na użytkownika todo
```
sudo su - todo
```
5. Sklonuj aplikację https://github.com/msl0/todos-fastify-sqlite.git. Uruchom i przetestuj działanie
```
git clone https://github.com/msl0/todos-fastify-sqlite.git app
npm install
node server.js
```
6. Zamknij aplikację. Przełącz się z powrotem na konto administratora. Skonfiguruj aplikację jako usługę. Włącz uruchamianie przy starcie systemu. Sprawdź logi usługi
```
exit
sudo vi /etc/systemd/system/todo.service
```
```
[Unit]
Description=ToDo App

[Service]
WorkingDirectory=/home/todo/app
ExecStart=/usr/bin/node /home/todo/app/server.js
User=todo
RestartSec=5s
Restart=always

[Install]
WantedBy=multi-user.target
```
```
sudo systemctl enable todo.service
sudo systemctl start todo.service
sudo journalctl -u todo.service
```
7. Zainstaluj nginx
```
sudo apt install nginx
```
8. Skonfiguruj nginx jako reverse proxy dla aplikacji todo tak by aplikacja była dostepna pod osobną domeną
```
sudo cp /etc/nginx/sites-available/default /etc/nginx/sites-available/reverse-proxy
sudo vi /etc/nginx/sites-available/reverse-proxy
```
```
server {
    listen 80;
    listen [::]:80;

    server_name todo;

    location / {
        proxy_pass http://localhost:3000;
    }
}
```
```
sudo ln -s /etc/nginx/sites-available/reverse-proxy /etc/nginx/sites-enabled/
sudo sytemclt restart nginx
```
9. Sprawdź czy serwer nginx wysyła swoją wersję w odpowiedzi, jeśli tak to wyłącz to.
```
sudo apt install nginx-extras
```
```
server {
    more_clear_headers Server;
    listen 80;
    ...
```

10. Skonfiguruj limit żądań POST
```
map $request_method $limit {
    default         "";
    POST            $binary_remote_addr;
}

limit_req_zone $limit zone=app:10m rate=1r/s;

server {
    ...
    location / {
        limit_req zone=app;
        ...
    }
```
11. Nadpisywanie błędów
```
sudo mkdir /var/www/html/errors
sudo chown -R $USER:$USER /var/www/html/errors
sudo chmod -R 755 /var/www
cp /tmp/error.html /var/www/html/errors/
vi /var/www/html/errors/error.html
```
```
<!-- <h1>ERROR PAGE</h1> -->
<img src="https://terierogrod.pl/wp-content/uploads/2021/07/memy1.png">
<style>
html,body{
    margin:0;
    height:100%;
}
img{
  display:block;
  width:100%;
  height:100%;
  object-fit: cover;
}
</style>
```
```
    location / {
        limit_req zone=app;
        proxy_pass http://localhost:3000;
        auth_basic "Auth required";
        proxy_intercept_errors on;
        auth_basic_user_file /etc/nginx/.htpasswd;
        #error_page 404 =301 $scheme://$http_host;
        error_page 500 500 500 500 500 404 =200 /error.html;
    }

    location /error.html {
      root /tmp/;
    }
```
12. Włącz uwierzytelnianie
```
sudo apt install apache2-utils
sudo htpasswd -c /etc/nginx/.htpasswd webuser1
```
```
...
    location / {
        auth_basic "Auth required";
        auth_basic_user_file /etc/nginx/.htpasswd;
        ...
```

## Dodatkowe

- Przygotuj skrypt wykonujący wdrożenie aplikacji
- Skonfiguruj HTTPS https://www.howtogeek.com/devops/how-to-create-and-use-self-signed-ssl-on-nginx/
