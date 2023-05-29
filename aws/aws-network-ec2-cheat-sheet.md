## Podstawy struktury AWS

`Region` - obszar geograficzny gdzie znajdują się serwerownie AWS

`Availbility Zone` - serwerowania AWS. W kazdym regionie jest od 2 do 6 AZs.

Serwisy dzielimy na regionalne i globalne:

- `Regionalne` - uruchamiane w danym region, pełna separacja miedzy regionami (np. EC2, RDS, Lambda)
- `Globalne` - usługi wsółdzielone miedzy regionami. Np. IAM, Route53, CloudFront.

## Podstawy sieci AWS

`VPC` - wirtualna przetrzeń adresowa (CIDR), w której uruchamiamy wirtualne maszyny, kontenery, bazy danych, itp.
Tworzona jest per region, ale może być wiele VPC w regionie.
Zakres adresacji musi być z prywatnej puli adresowej.

`Nie wszystkie serwisy mogą byc w VPC, przyklad: DynamoDB, S3`

`Internet Gateway` - ruter do Internetu, pozwala na komunikację między zasobami w VPC a Internetem. Komunikacja jest możliwa tylko jeśli zasób posiada publiczny adres IP.

`NAT Gateway` - Podobnie jak Internet Gateway pozwala na komunikację między zasobami wewnątrz subnetu a Internetem. Główna różnica to, że dokonuje translacji adresów przez co nie wymaga aby zasoby, które z niego korzystają miały przypisany publiczny adres IP.

`Route Table` - tablica rutingu - czyli tablica mówiąca gdzie pakiety wychodzące z subnetu mają być skierowane.

`Network ACL` - firewall do kontroli ruchu **z i do subnetów (na poziomie VPC)**. `Domyślna` konfiguracja - `wszystko odblokowane`. Typ - `stateless` - nie zachowuje stanu połączenia.

`Security group` - firewall do kontrolu ruchu **na poziomie subnetów, do i z zasobów takich jak serwer EC2, baza danych RDS**. `Domyślna` konfiguracja - `wszystko zablokowane`. Typ - `stateful` - zachowuje stan połączenia.

## IAM - Identity and Access Management

`IAM Users` - użytkownicy wewnątrz konta AWS, możliwość logowania się do konsoli webowej jak i dostęp przez AWS CLI/SDK przy pomocy wygenerowanej pary access key id/access key secret.
Przypinamy `IAM Policies` aby nadać uprawnienia.

`IAM Roles` - tożsamość dla zasobów, którym możemy nadawać uprawnienia. Wtedy proces działający na serwerze EC2 lub kontenerze bedzie miał uprawnienia do komunikacji z wybranym serwisem AWS przez jego API. Przyklad: chcemy aplikacja działająca na serwerze mogła tworzyć objekty w buckecie S3. Przypinamy `IAM Policies` aby nadać uprawnienia.

`IAM Policies` - zestaw uprawnień (*Allow*) lub zakazów (*Deny*), które można dopiąć do IAM Role lub IAM User. Policies możemy tworzyć samodzielnie (*Customer managed*) lub możemy użyc przygotowanych i zarządzanych przez AWS (*AWS managed*). Tych drugich nie możemy modyfikować. Przykład AWS managed policy - *arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore*

## EC2 - Elastic Compute Cloud

### Wirtualne serwery (Linux / Windows / Mac).

Serwery:

- uruchamiamy z przygotowanego wcześniej obrazu AMI (Amazon Machine Image), może to być czysty system udostępnony przez AWS lub innego dostawce, lub obraz naszego działającego serwera spakowany do AMI.
- uruchamiamy z przynajmniej jedną kartą sieciową w subnecie.
- nie można przenosić miedzy subnetami (trzeba skasować i uruchomić ponownie z obrazu). Serwery można uruchamiać (*launch*), zatrzymywać (*stop*), ponownie startować (*stop*), lub kasować (*terminate*).
- zatrzymane (*stop*) nie tracą prywatnego adresu IP ani danych przechowywanych na lokalnych dyskach.
- po zatrzymaniu serwera (*stop*), można zmienić jego typ/wielkość (dodać/zmniejszyć ilość procesorów i pamięci) bez utraty danych

Dostęp do serwerów:

- przez klucze RSA - logowanie SSH do Linux’a
- przez klucz RSA - haslo przy logowaniu do Windows
- przez `AWS SSM Session Manager` - terminal przez AWS Management Console
- przez EC2 Serial Console - mozliwosc podlaczenia sie do serial port wirtualne maszyny
- przez EC2 Instance Connect - logowanie przez SSH kiedy serwer ma publiczny adres

### EBS - Elastic Block Storage

Sieciowy system umożliwiający podłączenie dysków do serwerów wirtualnych EC2.

Najpopularniejszy i najbardziej wszechstronny typ: `gp3`

Cechy:

- dysk `tworzymy w wybranym AZ` (nie można przenosić miedzy AZ ani podłączyć do serwera który jest w innym AZ)
- dyski `można szyfrować`, brak strat na wydajności
- można robić `snapshot do S3` a następnie utworzyć w innym AZ/regionie/koncie
- można zwiększać dyski bez wyłączania serwera
- nie można zmniejszać dysków

### ASG - AutoScaling Groups

Usługa w serwisie EC2 pozwalająca skalować instancje EC2 w góre lub w dół (ilość serwerów a nie ich wielkość) zgodnie z instrukcjami ustawionym przez użytkownika.

ASG dba również, aby uruchimione serwery były zdrowe (zgodnie z zadanymi parametrami - health checks)

Skladniki:

- `Auto Scaling Groups` - definiujemy ile serwerów ma być uruchomionych i z jakimi parametrami oraz możemy zdefiniować czy i kiedy serwis ma zwiększyć/zmniejszyć ilość serwerów.
- `Launch Template` - definiujemy jak ma uruchomić się serwer w ASG (np. z jakiego obrazu AMI, w jakim subnecie, z jakiej Security Group oraz z jakimi uprawnieniami)

### ELB - Elastic Load Balancers

ELB automatycznie rozdziela ruch przychodzący do wielu instancji EC2 co pozwala osiągnąć wyższą odporność na awarie zapewniając jednocześnie wysoką wydajność. Pozwala również wykryć niedziałające instancje i automatycznie przekierować ruch do działających dopóki te uszkodzone nie zostaną ponownie przywrócone do pracy.

Typy:

- `Application Load Balancer`
  - najbardziej funcjonalny
  - działa na warstwie aplikacyjnej
  - rutowanie po path/host/nagłówkach http
  - zmienne adresy IP listenerów
- `Network Load Balancer`
  - najbardziej wydajny
  - działa na warstwie transportowej
  - obsługuje TCP i UDP
  - stałe adresy IP listenerów
- `Gateway Load Balancer`
  - działa na warstwie sieciowej
- `Classic Load Balancer`
  - pierwsza generacja load balancerów

#### ALB - Application Load Balancer

Właściwości:

- Obsługuje IPv4 i IPv5
- Musi być uruchomiony w min. 2 AZ, w kazdej AZ musi być min. 8 wolnych adresów IP.
- Stała nazwa domenowa dla load balancer endpoint, ale adresy IP pod spodem są zmienne.

Elementy:

- `Listener` - frontend load balancer'a
  - proces nasłuchujący na zdefiniowanych portach
  - terminacja SSL
  - możliwość definiowania reguł jak ma byc przekierowany ruch
- `Target group` - backend load balancer'a
  - możliwość definiowania gdzie będzi przekierowany ruch: 
    - serwerów EC2
    - kontenerów
    - adresów IP
    - funkcji AWS Lambda.
  - sprawdzanie stanu usługi (TCP - zwykly ping, HTTP/HTTPS - sprawdzenie czy usługa zwraca odpowiedniu return code)
