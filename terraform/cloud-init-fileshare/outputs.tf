output "cloud_init_base64_encoded" {
  value = data.template_cloudinit_config.vm_init_config_base64_encode.rendered
}

output "init_script" {
  value = data.template_file.init_script.rendered
}