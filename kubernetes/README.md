# minikube start

Domyslny hypervisor
```bash
minikube start
```

Hypervisor VirtualBox
```bash
minikube start --driver=virtualbox
minikube config set driver virtualbox
```

Hypervisor Hyperkit
```bash
minikube start --driver=hyperkit
minikube config set driver hyperkit
```

Hypervisor Hyper-V
```bash
minikube start --driver=hyperv
minikube config set driver hyperv
```

# Obraz Dockerowy do ćwiczeń

Obraz nie jest dostępny w Docker Hub, zamiast tego pliki potrzebne do jego zbudowania są dostępne w tym repozytorium.
Aby zbudować obraz, wykonaj następujące komendy:

```bash
cd docker
docker build --build-arg APP_VERSION=v1 -t isa/k8s:v1 .
docker build --build-arg APP_VERSION=v2 -t isa/k8s:v2 .
docker build --build-arg APP_VERSION=v3 -t isa/k8s:v3 .
```

następnie załaduj obraz do maszyny wirtualnej minikube:

```bash
minikube image load isa/k8s:v1
minikube image load isa/k8s:v2
```

# Uruchamianie PODa

Komenda uruchamia POD podając jako parametr obraz Dockerowy

```bash
kubectl run isa --image=isa/k8s:v1
```

# Aplikowanie zmian w klastrze z pliku YML

```bash
kubectl apply -f FILENAME
```

# Pobranie informacji o uruchomionych zasobach w klastrze

```bash
kubectl get pods
kubectl get replica-sets
kubectl get deployments
kubectl get services
kubectl get namespaces
```

# Uruchomienie HTTP proxy do k8s API

```bash
kubectl proxy
curl http://localhost:8001/version
```

# Modyfikacja wyjścia komend za pomocą szablonów

Na przykładzie pobrania nazwy podów - solo bez dodatkowego info:

```bash
kubectl get pods -o go-template --template '{{range .items}}{{.metadata.name}}{{"\n"}}{{end}}'
```

Użycie powyższej komendy do wstawienia nazwy poda do zmiennej środowiskowej.
UWAGA: zadziała tylko w przypadku uruchomienia **jednego** poda - w przypadku większej ilości zmienna będzie zawierac multiline string z wieloma nazwami.
Pomyśl jak zmodyfikowac komendę, aby dostać np. tylko pierwszy POD.

```bash
export POD_NAME=$(kubectl get pods -o go-template --template '{{range .items}}{{.metadata.name}}{{"\n"}}{{end}}')
```

# Pobranie danych z HTTP API o PODzie na podstawie zmiennej zawierającej nazwę PODa

```bash
curl http://localhost:8001/api/v1/namespaces/default/pods/$POD_NAME/
```

# Labelki

## Nadanie labelki istniejącemu PODowi

```bash
kubectl label pods $POD_NAME version=v1
```

## Pobranie wszystkich PODów zaiwerających konkretną labelkę (flaga `-l`)

```bash
kubectl get pods -l version=v1
```

# Wykonanie komendy na działającym PODzie

```bash
kubectl exec $POD_NAME -- komenda
# na przykład
kubectl exec $POD_NAME -- whoami
```

# Uruchomienie _zdalnej_ konsoli na działającym PODzie

```bash
kubectl exec -ti $POD_NAME -- bash
# lub jesli dany kontener nie ma bash'a, wtedy można użyc uboższego shella:
kubectl exec -ti $POD_NAME -- sh
```

# Pobranie logów z stdout/stderr PODa:

```bash
kubectl logs $POD_NAME
# lub w trybie ciągłym:
kubectl logs -f $POD_NAME
```

# Utworzenie deploymentu

```bash
kubectl create deployment isa-k8s-wshop --image=isa/k8s:v1
```

# Ekspozycja deploymentu jako serwis

W tym przypadku jako NodePort

```bash
kubectl expose deployment/isa-k8s-wshop --type="NodePort" --port 80
```

W przypadku minikube, istnieje konieczność wystawienia _dodatkowej warstwy serwisu_, która pozwoli naszej maszynie skomunikować się z _"wirtualną maszyną"_ minikube.

```bash
minikube service isa-k8s-wshop --url
```

# Usunięcie serwisu

```bash
kubectl delete service -l app=isa-k8s-wshop
```

# Próba odpytania serwisu przy pomocy node port

Zmienna NODE_PORT musi byc wczesniej ustawiona. W przypadku wystawienia serwera HTTP jak nginx, może to byc port 80.

```bash
curl $(minikube ip):$NODE_PORT
```

podobny zabieg z użyciem _zdalnej konsoli_ i odpytania PODa po localhost

```bash
kubectl exec -ti $POD_NAME -- curl localhost:8080
```

# Wystawienie serwisu jako LoadBalancer

```bash
kubectl expose deployment/isa-k8s-wshop --type="LoadBalancer" --port 80
```

minikube wymaga otwarcia **na osobnej karcie, cały czas uruchomionego w tle** tunelu:

```bash
minikube tunnel
```

nastepnie pobieramy serwisy, i kopiujemy EXTERNAL IP (najprawdopodobniej 127.0.0.1), by wykonać request który powinien zadziałać:

```bash
curl 127.0.0.1:80
```

# Pobranie deploymentów

```bash
kubectl get deployments
```

# Skalowanie deploymentu do 4 replik

```bash
kubectl scale deployments/isa-k8s-wshop --replicas=4
```

pobranie listy podów - zobaczymy ich wiecej po wyskalowaniu

```bash
kubectl get pods -o wide
```

pobranie opisu deploymentu potwierdzającego wyskalowanie

```bash
kubectl describe deployments/isa-k8s-wshop
```

wyskalowanie w dół do 2 replik

```bash
kubectl scale deployments/isa-k8s-wshop --replicas=2
```

i znowu wywołanie requestu do serwisu:
```bash
curl $(minikube ip):$NODE_PORT
```

# "Release" nowej wersji aplikacji przez podmianę obrazu Dockerowego

```bash
kubectl set image deployments/isa-k8s-wshop k8s=isa/k8s:v2
```

# Pobranie informacji o statusie zmian w deploymencie (status deploymentu/releasu)

```bash
kubectl rollout status deployments/isa-k8s-wshop
```

# Wycofanie releasu/deploymentu

Wycofanie przywraca wszystkie poprzednie ustawienia z poprzedniego stanu.

```bash
kubectl rollout undo deployments/isa-k8s-wshop
```

# Wystawienie ingress w minikube

Instalacja/włączenie addonu ingress
```bash
minikube addons enable ingress
```

Uruchomienie tunelu
```bash
minikube tunnel
```

# Uruchomienie metryk w minikube

```bash
minikube addons enable metrics-server
```

# Autoskalowanie

```bash
kubectl autoscale deployment frontend --min=1 --max=3 --cpu-percent=50
```

Weryfikacja
```bash
# n - number of requests
# c - concurrency
ab -n 1000000 -c 100 http://<ADRES>
#
kubectl get hpa,deployment
```

# Komendy security

Zmiana ustawień na klastrze
```bash
kubectl label --dry-run=server --overwrite ns --all pod-security.kubernetes.io/enforce=privileged
kubectl label --dry-run=server --overwrite ns --all pod-security.kubernetes.io/enforce=baseline
kubectl label --dry-run=server --overwrite ns --all pod-security.kubernetes.io/enforce=restricted
kubectl label --dry-run=server --overwrite ns <KONKRETNY NAMESPACE> pod-security.kubernetes.io/enforce=restricted
kubectl label --dry-run=server --overwrite ns default pod-security.kubernetes.io/enforce=restricted
```

Zmiana ustawień w namespace (przykład)
```bash
kubectl label --dry-run=server --overwrite ns default pod-security.kubernetes.io/enforce=privileged
```

# Przydatne linki

Dokumentacja kubernetes ze składnią poszczególnych resources k8s w plikach YML
https://kubernetes.io/docs/reference/kubernetes-api/workload-resources/pod-v1/

Narzędzie do podglądania zasobów w klastrze za pomocą terminala
https://k9scli.io/

Helm charts
https://helm.sh/docs/intro/quickstart/

POD security standards
https://kubernetes.io/docs/concepts/security/pod-security-standards/
