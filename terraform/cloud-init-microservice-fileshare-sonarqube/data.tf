data "template_file" "telegraf_env" {
  template = file("${path.module}/configs/telegraf.env")

  vars = {
    TELEGRAF_OUT_INFLUX_HOST   = var.telegraf_out_influxdb_host
    TELEGRAF_OUT_INFLUX_TOKEN  = var.telegraf_out_influxdb_token
    TELEGRAF_OUT_INFLUX_ORG    = var.telegraf_out_influxdb_org
    TELEGRAF_OUT_INFLUX_BUCKET = var.telegraf_out_influxdb_bucket

    # Tags
    TAG_CUSTOMER       = lookup(var.tags, "Customer", "null")
    TAG_ENV            = lookup(var.tags, "Env", "null")
    TAG_DEPLOYMENT     = lookup(var.tags, "Deployment", "null")
    TAG_RESOURCE_GROUP = lookup(var.tags, "ResourceGroup", "null")
    TAG_OWNER          = lookup(var.tags, "Owner", "null")
    TAG_EMAIL          = lookup(var.tags, "Email", "null")
    TAG_MODULE         = lookup(var.tags, "Module", "null")
  }
}

data "template_file" "cloud_init" {
  template = file("${path.module}/configs/cloud_init_config.yaml")

  vars = {
    docker_compose_file_base64_content = base64encode(var.docker_compose_content)
    docker_compose_file_path           = "docker-compose.yaml"
    telegraf_env_base64_content        = base64encode(data.template_file.telegraf_env.rendered)
    telegraf_run                       = var.enable_telegraf ? "restart" : "stop"
  }
}

data "template_file" "init_script" {
  template = file("${path.module}/configs/init.sh")

  vars = {
    resource_group_name      = var.resource_group_name
    docker_compose_file_path = "docker-compose.yaml"

    # Azure login
    azure_identity_login   = var.azure_identity_login
    azure_user_identity_id = var.azure_user_identity_object_id

    # Docker login
    acr_login    = var.acr_login
    docker_login = var.docker_login
    login_server = var.login_server
    username     = var.username
    password     = var.password

    # FileShare Settings
    file_share_settings             = var.file_share_settings
    file_share_storage_account_name = var.file_share_storage_account_name
    file_share_name                 = var.file_share_name
    file_share_mount_path           = var.file_share_mount_path
    file_share_gid                  = var.file_share_gid
    file_share_uid                  = var.file_share_uid
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