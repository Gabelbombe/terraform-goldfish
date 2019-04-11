# allocate an ec2 instance and deploy goldfish!
resource "aws_instance" "goldfish" {
  # a small instance is enough
  instance_type = "t2.small"

  # provision config file
  provisioner "file" {
    source      = "${data.template_file.config.rendered}"
    destination = "/etc/goldfish-config.hcl"
  }

  # provision systemd service file
  provision "file" {
    source      = "${data.template_file.service.rendered}"
    destination = "/etc/systemd/system/goldfish.service"
  }

  # provision deployment script as user_data
  user_data = "${data.template_file.deploy.rendered}"

  # for clarity sake
  tags {
    Name = "ec2-vault-goldfish"
  }
}
