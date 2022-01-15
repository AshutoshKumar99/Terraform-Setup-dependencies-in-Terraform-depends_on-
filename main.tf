provider "aws" {
    region = "ap-south-1" 
}

#We can have more ins. like below, and terraform is not going to respect the order we put in here.
#Before the webserver, we have a db server that needs to cope up first.

resource "aws_instance" "db" {
  ami           = "ami-052cef05d01020f1d"
  instance_type = "t2.micro"
}

resource "aws_instance" "web" {
  ami           = "ami-052cef05d01020f1d"
  instance_type = "t2.micro"
  depends_on = [aws_instance.db] #Explicit dependecy, first db server will be created and then web server when running apply cmd.
}

#first db ins. will be created and once that db ins is up and running , then web server will be created and up and running.
#depends_on can be used for EIP also. because sometimes it takes a bit time to provision.

 