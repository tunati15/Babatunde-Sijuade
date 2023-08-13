output "ec2_public_ip" {
    value = aws_instance.Test-server.public_ip
}