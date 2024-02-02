resource "kubernetes_deployment_v1" "mysql-deploy" {
  metadata {
        name = "mysql"
  }

  spec {
        replicas = 2
        selector {
        match_labels = {
        app = "mysql"
        }
        }

        template {
        metadata {
        labels = {
        app = "mysql"
        }
        }

        spec {
        container {
        name  = "mysql-deploy"
        image = "docker.io/mysql:5.6"
        volume_mount {
                name    = "test"
                mount_path = "/data"
        }
        }

        volume {
        name = "test"
        persistent_volume_claim {
                claim_name = "${var.mypvc}"
# kubernetes_persistent_volume_claim.example.metadata.0.name
        }
        }
        }
        }
  }
}