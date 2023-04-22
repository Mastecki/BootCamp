SETUP service mesha Consul
==========================

# Uruchomienie klastra ze zwiekszonymi zasobami

```bash
minikube start --profile dc1 --memory 4096
 ```

# Setup Consul

```bash
brew tap hashicorp/tap
brew install hashicorp/tap/consul-k8s
consul-k8s install -config-file=values.yaml -set global.image=hashicorp/consul:1.14.0
```

Potwierdzenie:

```bash
kubectl get pods --namespace consul
```

# Komunikacja lokalna z Consul

```bash
export CONSUL_HTTP_TOKEN=$(kubectl get --namespace consul secrets/consul-bootstrap-acl-token --template={{.data.token}} | base64 -d)
export CONSUL_HTTP_ADDR=https://127.0.0.1:8501
export CONSUL_HTTP_SSL_VERIFY=false
```

Uruchomienie tunelu do Consul w drugim terminalu:
```bash
kubectl port-forward svc/consul-ui --namespace consul 8501:443
```

Test komend Consul:
```bash
consul catalog services
consul members
```

# Uruchomienie serwisów

```bash
kubectl apply -f counting.yaml
kubectl apply -f dashboard.yaml
```

W drugim terminalu uruchom tunel do serwisu:

```bash
kubectl port-forward svc/dashboard --namespace default 9002:9002
```

Uruchom przeglądarkę pod adresem http://localhost:9002/

# Consul intentions

```bash
kubectl apply --filename intentions.yaml
```

W drugim terminalu uruchom tunel do serwisu, lub nie zamykaj już otwartego:

```bash
kubectl port-forward svc/dashboard --namespace default 9002:9002
```

