resource "aws_instance" "jenkins" {
    ami = "ami-07ff62358b87c7116"
    instance_type = "t3.small"
    vpc_security_group_ids = [ aws_security_group.ports.id ]
    user_data = file("jenkins.sh")
    key_name = file ("/c/devops/ec2key.pem") 
}

resource "aws_security_group" "ports" {
  
  name = "allow ports ssh and jenkins"
  description = "allow ports ssh and jenkins"

    ingress {

    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {

    from_port = 8080
    to_port = 8080
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
     from_port = 0
     to_port = 0
     protocol = "-1"
     cidr_blocks = ["0.0.0.0/0"]

    }

    tags = {
        name = "allowing ports ssh and jenkins"
    }

}