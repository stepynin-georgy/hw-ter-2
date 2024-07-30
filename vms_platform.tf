###cloud vars

variable "vm_db_cloud_id" {
  type        = string
  default     = "b1gpidh9fbq31fqojvmu"
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "vm_db_folder_id" {
  type        = string
  default     = "b1gbaccuaasnld9i4p6h"
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "vm_db_default_zone" {
  type        = string
  default     = "ru-central1-b"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "vm_db_default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vm_db_vpc_name" {
  type        = string
  default     = "hw2-2"
  description = "VPC network & subnet name"
}

variable "vm_db_platform_id" {
  type        = string
  default     = "standard-v1"
  description = "yandex_compute_image family"
}

variable "vm_db_name" {
  type        = string
  default     = "netology-develop-platform-db"
  description = "yandex_compute_instance name"
}


###ssh vars

variable "vm_db_vms_ssh_root_key" {
  type        = map(string)
  default = {
      serial-port-enable = 1
      ssh-keys           = "ubuntu:ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFA6w26woMM8N8kifMZBGG1B3iMaxxSROyKOkZ2qiSPW root@netology"
  }
  description = "ssh-keygen -t ed25519"
}