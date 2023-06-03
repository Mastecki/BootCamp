# Load Balancer

W kolejnych punktach utworzymy Application Load Balancer (typu publicznego), ktory bedzie kierował ruch do naszej aplikacji z Internetu.

Ruch z internetu bedzie ograniczony do portów HTTP i HTTPS przez Security Group - public.

Ruch pomiedzy Load Balancerem a naszą aplikacją działającą na ECS bedzie ograniczony do portu 5000 przy pomocy Security Group - private.

## Target Group

Tworzymy najpierw Target Group.

### TG - Basic configuration

* Target type - `IP addresses`
* Protocol - `HTTP` , port - `5000`
* IP address type - `IPv4`
* Wybieramy swoje VPC
* Protocol version - `HTTP1`

### TG - Health checks

* Health check protocol - `HTTP`
* Health check path - `/`
* Health check port - `Traffic port`
* Healthy threshold - `2`
* Unhealthy threshold - `2`
* Timeout - `5`
* Interval - `30`
* Success codes - `200, 202`

### TG - Register targets

Tą część pomijamu, ECS Service sa zarejestruje taski.
Jedyne co musimy wybrać to Network.

## Application Load Balancer

Tworzymy Application Load Balancer

### ALB - Basic configuration

Wybieramy Application Load Balancer

* Load balancer name - `wybieramy swoja nazwe`
* Scheme - `Internet-facing`
* IP address type - `IPv4`

### ALB - Network mapping

* VPC - `wybieramy swoje VPC`
* Mappings - zaznaczamy `obie Availbility Zones` i wybieramy `publiczne` sieci.

### Security groups

* Odznaczamy `default`
* wybieramy nasze security grupy `public` i `private`

### Listeners and routing

* Listener: `HTTP:80`
* Protocol - `HTTP`
* Port - `80`
* Default action - `Forward to` i wybieramy naszą Target Group

> **Warning**
> NIE zaznaczamy `AWS Global Accelerator`