resource "yandex_vpc_network" "develop" {
  name = var.vm_web_vpc_name
}
resource "yandex_vpc_subnet" "develop" {
  name           = var.vm_web_vpc_name
  zone           = var.default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr
}


data "yandex_compute_image" "ubuntu" {
  family = var.vm_family
}

resource "yandex_compute_instance" "platform" {
  name        = local.vm_web_lname
  platform_id = var.vm_web_platform_id
  resources {
    core_fraction = var.vm_db_web_resources.web_res.core_fraction
    cores         = var.vm_db_web_resources.web_res.cores
    memory        = var.vm_db_web_resources.web_res.memory
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = false
  }

  metadata = var.vms_ssh_root_key

#  metadata = {
#    serial-port-enable = 1
#    ssh-keys           = "ubuntu:${var.vms_ssh_root_key}"
#  }
}

resource "yandex_vpc_network" "develop-2" {
  name = var.vm_db_vpc_name
}
resource "yandex_vpc_subnet" "develop-2" {
  name           = var.vm_db_vpc_name
  zone           = var.default_zone
  network_id     = yandex_vpc_network.develop-2.id
  v4_cidr_blocks = var.default_cidr
}

resource "yandex_compute_instance" "platform-2" {
  name        = local.vm_db_lname
  platform_id = var.vm_db_platform_id
  resources {
    core_fraction = var.vm_db_web_resources.db_res.core_fraction
    cores         = var.vm_db_web_resources.db_res.cores
    memory        = var.vm_db_web_resources.db_res.memory
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = false
  }

  metadata = var.vm_db_vms_ssh_root_key

#  metadata = {
#    serial-port-enable = 1
#    ssh-keys           = "ubuntu:${var.vms_ssh_root_key}"
#  }
}