# ECS Service 

Service - używany do uruchamiania Tasków które mają działać non-stop

* ECS dba aby ilość działających tasków była zgodna z wymaganiami
* można podłączyć Application Load Balancer
* możliwość automatycznego skalowania (zwiększania/zmniejszania) ilości Tasków 

https://eu-west-1.console.aws.amazon.com/ecs/v2/clusters?region=eu-west-1

Wchodzimy do swojego ECS Clustra i wybieramy Create service

## Create

### Environment

* wybieramy Compute options - `Launch type`

### Deployment configuration

* Application type - `Service`
* Task definition
  * wybieramy `nasz Task Definition Family`
  * wybieramy revision - `LATEST`
* nadajemy naszemu serwisowi nazwę

### Networking

* vpc powinno juz byc wybrane
* odznaczamy subnety public, zostawiamy `subnety private`
* wybieramy security group `private`
* Public IP - `Turned off`

### Load balancing

* Load balancer type - `Application Load Balancer`
* wybieramy `Use an existing load balancer`
* Listener - `Use an existing listener`
* Target group - `Use an existing target group`
* Health check grace period - `20`
