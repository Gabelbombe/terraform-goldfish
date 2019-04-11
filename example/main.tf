module "vault_cluster" {
  source = "github.com/hashicorp/terraform-aws-vault.git/modules/vault-cluster?ref=v0.11.3"

  cluster_name  = "my-vault-cluster"
  cluster_size  = 3
  instance_type = "t2.micro"

  ami_id    = "${var.ami_id}"
  user_data = "${data.template_file.user_data_vault_cluster.rendered}"

  vpc_id     = "${data.aws_vpc.default.id}"
  subnet_ids = "${data.aws_subnet_ids.default.ids}"
}
