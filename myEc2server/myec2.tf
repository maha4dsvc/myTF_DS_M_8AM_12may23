
# varibles
variable "region" {
    default = "us-east-2"
}
variable "access_key" {
    default = "AKIAR5TMHQ5UFRYOVWMN"
}
variable "secret_key" {
    default = "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"
}

variable "myamiid" {
        default = "ami-0a695f0d95cefc163"
}

variable "instancetype" {
        default = "t2.micro"
}

variable "keyname" {
        default = "myOhiokey"
}



# provider

provider "aws" {
  region     = "${var.region}"
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
}

# Reosources
resource "aws_instance" "myawsintance" {
  ami           = "${var.myamiid}"
  instance_type = "${var.instancetype}"
  key_name      = "${var.keyname}"

  tags = {
    Name = "myawsinstance"
  }
}


# output

output "instance_public_dns" {
  value = "${aws_instance.myawsintance.public_dns}"
}



