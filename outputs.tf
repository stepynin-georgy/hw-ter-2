output "platform" {
  value = { 
    name = yandex_compute_instance.platform.name
    external_ip = yandex_compute_instance.platform.network_interface.0.nat_ip_address
    fqdn = yandex_compute_instance.platform.fqdn
  }
}

output "platform-2" {
  value = { 
    name = yandex_compute_instance.platform-2.name
    external_ip = yandex_compute_instance.platform-2.network_interface.0.nat_ip_address
    fqdn = yandex_compute_instance.platform-2.fqdn
  }
}