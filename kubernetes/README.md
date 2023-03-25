cd docker
docker build --build-arg APP_VERSION=v1 -t isa/k8s:v1 .
docker build --build-arg APP_VERSION=v2 -t isa/k8s:v2 .
docker build --build-arg APP_VERSION=v3 -t isa/k8s:v3 .

minikube image load isa/k8s:v1
minikube image load isa/k8s:v2

kubectl run isa --image=isa/k8s:v1

kubectl apply -f FILENAME

kubectl get pods

kubectl get replica-sets

kubectl get deployments

kubectl get services

kubectl get namespaces

kubectl proxy

curl http://localhost:8001/version

kubectl get pods -o go-template --template '{{range .items}}{{.metadata.name}}{{"\n"}}{{end}}'

export POD_NAME=$(kubectl get pods -o go-template --template '{{range .items}}{{.metadata.name}}{{"\n"}}{{end}}')

curl http://localhost:8001/api/v1/namespaces/default/pods/$POD_NAME/

kubectl label pods $POD_NAME version=v1

kubectl get pods -l version=v1

kubectl exec $POD_NAME -- whoami

kubectl exec -ti $POD_NAME -- bash

kubectl logs $POD_NAME

kubectl create deployment isa-k8s-wshop --image=isa/k8s:v1

kubectl expose deployment/isa-k8s-wshop --type="NodePort" --port 80

minikube service isa-k8s-wshop --url

kubectl delete service -l app=isa-k8s-wshop

curl $(minikube ip):$NODE_PORT

kubectl exec -ti $POD_NAME -- curl localhost:8080

kubectl get deployments

kubectl scale deployments/isa-k8s-wshop --replicas=4

kubectl get pods -o wide

kubectl describe deployments/isa-k8s-wshop

kubectl scale deployments/isa-k8s-wshop --replicas=2
curl $(minikube ip):$NODE_PORT

kubectl set image deployments/isa-k8s-wshop k8s=isa/k8s:v2

kubectl get pods

kubectl rollout status deployments/isa-k8s-wshop

kubectl rollout undo deployments/isa-k8s-wshop

https://kubernetes.io/docs/reference/kubernetes-api/workload-resources/pod-v1/

https://k9scli.io/
