resource "aws_instance" "apache_server" {
  ami           = "ami-0c55b159cbfafe1f0" # Ubuntu Server 24.04 LTS (us-east-1)
  instance_type = "t2.micro"

  key_name      = "my-key-pair" # Cambia por el nombre de tu clave SSH

  tags = {
    Name = "ApacheServer"
  }

  user_data = <<-EOF
              #!/bin/bash
              sudo apt update
              sudo apt install apache2 -y
              EOF
}

