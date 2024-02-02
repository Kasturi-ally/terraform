provider "kubernetes" {
  config_path = "~/.kube/config"
}
resource "kubernetes_persistent_volume_claim" "mypvc" {
  metadata {
        name = "${var.mypvc}"
  }
  spec {
        storage_class_name = "manual"
        access_modes = ["ReadWriteMany"]
        resources {
        requests = {
        storage = "5Gi"
        }
        }
        volume_name = "${kubernetes_persistent_volume.mypv.metadata.0.name}"
  }
}

resource "kubernetes_persistent_volume" "mypv" {
  metadata {
        name = "${var.mypv}"
  }
  spec {
        storage_class_name = "manual"
        capacity = {
        storage = "10Gi"
        }
        access_modes = ["ReadWriteMany"]
        persistent_volume_source {
        nfs {
        path = "/data"
        server = "controlplane"
        }
        }
        }
        }