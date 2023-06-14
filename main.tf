

provider "aws"{
    region = "eu-west-3"
    access_key = "AKIAZVO5TCKNDYYDZPEI"
    secret_key = "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"
  
}

variable "enviroment" {
  description = "deplyment enviroment"
}


resource "aws_vpc" "development-vpc" {
    cidr_block = "10.0.0.0/16"
    tags = {
      Name: var.enviroment
      vpc_env: "dev"
    }
  
}

variable "subnet_cidr_block" {
  description = "subnet cidr block"
}


resource "aws_subnet" "dev-subnet-1" {
    vpc_id =  aws_vpc.development-vpc.id
    cidr_block = var.subnet_cidr_block /*"10.0.0.0/24"*/ 
    availability_zone = "eu-west-3a"
     tags = {
      Name: "subnet-1-dev"
    }
  
}

/*to remove resource from our vpc, we just delete
the code line from the idle */


/* 



*/
data "aws_vpc" "existing_vpc"{
    default = true

}

variable "vpc_cidr_block" {
  description = "vpc cidr block"
}
resource "aws_subnet" "dev-subnet-2" {
    vpc_id = data.aws_vpc.existing-vpc.id
    cidr_block = var.vpc_cidr_block 
    availability_zone = "eu-west-3a"
    user_data= file("entry-script.sh")
      tags = {
      Name: "subnet-2-dev-default"
      
    }
  
}
output "vpc-dev-id" {
    value = aws_vpc.development-vpc

  
}

output "vpc-subnet-id" {
    value = aws_subnet.dev-subnet-1.id
    
  
}

