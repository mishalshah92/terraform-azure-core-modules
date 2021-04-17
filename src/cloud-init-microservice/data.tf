data "template_file" "cloud_init" {
  template = file("${path.module}/configs/cloud_init_config.yaml")

  vars = {
    docker_compose_file_base64_content = base64encode(var.docker_compose_content)
    docker_compose_file_path           = "docker-compose.yaml"
  }
}

data "template_file" "init_script" {
  template = file("${path.module}/configs/init.sh")

  vars = {

    # Login
    azure_identity_login   = var.azure_identity_login
    azure_user_identity_id = var.azure_user_identity_object_id == null ? "null" : var.azure_user_identity_object_id

    # Docker login
    acr_login    = var.acr_login
    docker_login = var.docker_login
    login_server = var.login_server == null ? "null" : var.login_server
    username     = var.username == null ? "null" : var.username
    password     = var.password == null ? "null" : var.password

    # Other
    docker_compose_file_path = "docker-compose.yaml"
  }
}

data "template_cloudinit_config" "vm_init_config_base64_encode" {
  gzip          = true
  base64_encode = true

  # Main cloud-config configuration file.
  part {
    filename     = "init.cfg"
    content_type = "text/cloud-config"
    content      = data.template_file.cloud_init.rendered
  }

  part {
    content_type = "text/x-shellscript"
    content      = data.template_file.init_script.rendered
  }
}