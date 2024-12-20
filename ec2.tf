resource "aws_instance" "apache_server" {
  ami           = "ami-0c55b159cbfafe1f0" # Amazon Linux 2 AMI (us-east-1)
  instance_type = "t2.micro"

  key_name      = "my-key-pair" # Cambia por el nombre de tu clave SSH

  tags = {
    Name = "ApacheServer"
  }

  user_data = <<-EOF
              #!/bin/bash
              sudo yum update -y
              sudo yum install -y httpd
              sudo systemctl start httpd
              sudo systemctl enable httpd
              echo "<h1>Hola, Apache está funcionando en EC2</h1>" > /var/www/html/index.html
              EOF
}

