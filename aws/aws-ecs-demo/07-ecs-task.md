# ECS Task Definition

Task Definition - konfiguracja jak ma być uruchomiony kontener (lub więcej) jako Task

* zawiera informacje o wymaganiach dot. CPU i pamięci
* jak mają być zbierane logi
* mapowanie portów
* mapowanie dysków

## Tworzymy Task Definition

https://eu-west-1.console.aws.amazon.com/ecs/v2/task-definitions?region=eu-west-1

* Create new task definition

### Configure task definition and containers

* Task definition family - `nazwa naszego task definition`, w takiej "rodzinie" może działać wiele kontenerów.
* Container - 1 
  * Name - `flask-web`
  * Image URI - `844187532425.dkr.ecr.eu-west-1.amazonaws.com/`<REPOSITORY_NAME>`:latest`
  * Container port - `5000`
  * HealthCheck 
    * Command - `CMD-SHELL, curl -f http://localhost:5000 || exit 1`
    * Interval - `30`
    * Timeout - `5`
    * Start period - `30`
    * Retries - `3`

### Configure environment, storage, monitoring, and tags

* Environment 
  * App environment - `AWS Fargate (serverless)`
  * Operating system/Architecture - `Linux/X86_64`
  * Task size - `CPU .25 vCPU, Memory .5 GB`
  * Task role - `AmazonECSTaskExecutionRolePolicy`
  * Task execution role - `AmazonECSTaskExecutionRolePolicy`

* Monitoring and logging 
  * Zaznaczamy `Use log collection`
  * Amazon CloudWatch 
  * wpisujemy nazwe log group z poprzedniego punktu
  * wpisujemy region - `eu-west-1`

