# Budujemy claster ECS Fargate

ECS - Elastic Container Service

Fargate - kontenery w chmurze w wersji serveless, czyli wirtualnymi maszynami zarządza AWS - my tylko definiujemy ile cpu i pamięci mają dostać nasze kontenery.

## ECS Cluster

https://eu-west-1.console.aws.amazon.com/ecs/v2/clusters?region=eu-west-1

* Create cluster

### ECS Cluster - Cluster configuration

* Cluster name - `nadajemy nazwe`

### ECS Cluster - Networking

* wybieramy nasze `VPC`
* wybieramy nasze `prywatne subnety`

### ECS Cluster - Monitoring

* zachecam zawsze do włączania `Use Container Insights`
