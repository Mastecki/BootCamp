# Budowanie aplikacji

Przed wykonaniem ponizszych kroków musimy znać nazwe repozytorium ECR.
W poniższym kodzie musimy podstawic tą nazwę do zmiennej $REPONAME

```bash
export AWS_DEFAULT_REGION=eu-west-1
export AWS_PROFILE=infoshare
export REPONAME=<nazwa naszego ECR repository>

```

## Budowanie kontenera

```bash
cd code
docker build -t app .
docker tag app 844187532425.dkr.ecr.eu-west-1.amazonaws.com/${REPONAME}:latest
```

## Reczne pushowanie kontenera do ECR

```bash
aws ecr get-login-password --region eu-west-1 | docker login --username AWS --password-stdin 844187532425.dkr.ecr.eu-west-1.amazonaws.com/${REPONAME}
docker push 844187532425.dkr.ecr.eu-west-1.amazonaws.com/${REPONAME}:latest
```
