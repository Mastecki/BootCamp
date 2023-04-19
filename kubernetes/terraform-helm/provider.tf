provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

resource "helm_release" "redis" {
  name       = "redis-from-helm"
  repository = "https://charts.bitnami.com/bitnami"
  chart = "redis"
}

provider "kubernetes" {
  config_path    = "~/.kube/config"
}

data "kubernetes_config_map" "postgres" {
  metadata {
    name = "postgres-cm"
  }
}

resource "helm_release" "postgres" {
  name  = "postgres-from-helm"
  repository = "https://charts.bitnami.com/bitnami"
  chart = "postgresql"

  set {
    name  = "global.postgresql.auth.database"
    value = data.kubernetes_config_map.postgres.data["postgres.db"]
  }

  set {
    name  = "global.postgresql.auth.username"
    value = "user_postgres"
  }

  set {
    name  = "global.postgresql.auth.password"
    value = "user_password"
  }
}
