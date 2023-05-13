# variables
variable "myaccess_key" { }
variable "mysecret_key" { }
variable "myregion" { default = "us-east-2"}

#  provider
provider "aws" {
  access_key = "${var.myaccess_key}"
  secret_key = "${var.mysecret_key}"
  region = "${var.myregion}"
}


#  resources
resource "aws_instance" "mywebserver" {
  ami = "ami-06c4532923d4ba1ec"
  instance_type = "t2.micro"
  key_name = "myOhiokey"


  connection {
     type="ssh"
     user="ubuntu"
     host= aws_instance.mywebserver.public_ip
     private_key="${file("myOhiokey.pem")}"
     agent =false
     timeout="100s"
     
  }

  provisioner "remote-exec" {
    inline = [ 
      "sudo apt-get update",
      "sudo apt-get install apache2 -y",
     ]
  }


}


#  outputs
output "myinstaceID" { value = aws_instance.mywebserver.public_ip }

