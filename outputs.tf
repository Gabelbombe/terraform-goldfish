output "goldfish_public_ip" {
  value = "${aws_instance.goldfish.public_ip}"
}
