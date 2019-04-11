output "goldfish_public_ip" {
  description = "The public IP address used to access the Vault UI"
  value       = "${aws_instance.goldfish.public_ip}"
}
