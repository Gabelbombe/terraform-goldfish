# templating the config file with variables above
data "template_file" "config" {
  template = "${file("${path.module}/template/config.hcl.tpl")}"

  vars {
    listener = "${var.listener}"
    vault    = "${var.vault}"
  }
}

# templating the systemd service file
data "template_file" "service" {
  template = "${file("${path.module}/template/goldfish-service.tpl")}"

  vars {
    WRAPPING_TOKEN = "${var.wrapping_token}"
  }
}

# templating the deployment file
data "template_file" "deploy" {
  template = "${file("${path.module}/template/deploy.sh.tpl")}"

  vars {
    GOLDFISH_VERSION = "${var.goldfish_version}"
  }
}
