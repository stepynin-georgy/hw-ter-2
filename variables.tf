###cloud vars
variable "token" {
  type        = string
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
}

variable "cloud_id" {
  type        = string
  default     = "b1gpidh9fbq31fqojvmu"
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  default     = "b1gbaccuaasnld9i4p6h"
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vm_web_vpc_name" {
  type        = string
  default     = "hw2-1"
  description = "VPC network & subnet name"
}

variable "vm_family" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "yandex_compute_image family"
}

variable "vm_web_platform_id" {
  type        = string
  default     = "standard-v1"
  description = "yandex_compute_image family"
}

variable "vm_web_name" {
  type        = string
  default     = "netology-develop-platform-web"
  description = "yandex_compute_instance name"
}

variable "vm_db_web_resources" { 
  type         = map(map(number))
  default      = {
    web_res = {
      cores = 2
      memory = 1
      core_fraction = 20
    }
    db_res = {
      cores = 2
      memory = 2
      core_fraction=20
    }
  }
}

###ssh vars

variable "vms_ssh_root_key" {
  type        = map(string)
  default = {
      serial-port-enable = 1
      ssh-keys           = "ubuntu:ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFA6w26woMM8N8kifMZBGG1B3iMaxxSROyKOkZ2qiSPW root@netology"
  }
  description = "ssh-keygen -t ed25519"
}

variable "test" { 
  type         = list(map(list(string)))
  default      = [
    {
    dev1 = [
      "ssh -o 'StrictHostKeyChecking=no' ubuntu@62.84.124.117",
      "10.0.1.7",
    ]
    },
    {
    dev2 = [
      "ssh -o 'StrictHostKeyChecking=no' ubuntu@84.252.140.88",
      "10.0.2.29",
    ]
    },
    {
    prod1 = [
      "ssh -o 'StrictHostKeyChecking=no' ubuntu@51.250.2.101",
      "10.0.1.30",
    ]
    }
  ]
}
