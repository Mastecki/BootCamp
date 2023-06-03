# Elastic Container Registry

Prywatny rejestr do przechowywania obrazow naszych kontenerów.

## Tworzymy Private Registry

https://eu-west-1.console.aws.amazon.com/ecr/home?region=eu-west-1

### Get started

* Visibility settings - `Private`
* Repository name - `wybieramy nazwe dla naszego repozytorium`

### Permissions

* Wybieramy `Edit policy JSON` i wklejamy ponizszy zestaw uprawnien ktory pozwoli kazdemy uzytkownikowi naszego konta na push'owanie i pull'owanie obrazow dockerowych.

```json
{
    "Version": "2008-10-17",
    "Statement": [
        {
            "Sid": "Grant Access",
            "Effect": "Allow",
            "Principal": "*",
            "Action": [
                "ecr:GetDownloadUrlForLayer",
                "ecr:BatchGetImage",
                "ecr:BatchCheckLayerAvailability",
                "ecr:PutImage",
                "ecr:InitiateLayerUpload",
                "ecr:UploadLayerPart",
                "ecr:CompleteLayerUpload",
                "ecr:DescribeRepositories",
                "ecr:GetRepositoryPolicy",
                "ecr:ListImages",
                "ecr:DeleteRepository",
                "ecr:BatchDeleteImage",
                "ecr:SetRepositoryPolicy",
                "ecr:DeleteRepositoryPolicy"
            ]
        }
    ]
}
```

### Lifecycle policy

* klikamy na  `Create lifecycle rule`
* Wpisujemy opis w `Rule description`
* wybieramy aby serwis trzymal tylko `5 ostatnich obrazow` nie zaleznie czy maja tag czy nie.