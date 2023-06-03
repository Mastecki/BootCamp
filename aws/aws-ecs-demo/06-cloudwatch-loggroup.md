# Tworzymy CloudWatch Log group

Chcemy aby nasza aplikacja działająca w kontenerze mogła wysyłac logi do CloudWatch Logs. W tym celu najpierw musimy uwtorzyc log group

https://eu-west-1.console.aws.amazon.com/cloudwatch/home?region=eu-west-1#logsV2:log-groups

* `Create log group`
* Podajecie nazwe log groupy w ktorej beda streamy z logami
* Zachecam do ustawienie `Retention setting` na np. `5 dni`