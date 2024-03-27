# packer puglin in AWS
# https://www.packer.io/plugins/builders/amazon
packer{
	required_plugins {
		amazon = { 
		  version = ">=0.0.2"
		  source  = "github.com/hashicorp/amazon"
	}
    }
}

# WHICH AMI To use as the base and where to save it 
source "amazon-ebs" "ubuntu" {
  region          = "ap-southeast-2"
  ami-name        = "ami-ubuntu-{{timestamp}}" 
  instance_type   = "t2.micro"
  source_ami      = "ami-d38a4ab1"
  ssh_username    = "ubuntu"
  ami_users       = ["909090909","090990909900",9059595009"]
  ami_regions     = [
			"us-east-1"
			"ap-southeast2"
			"eu-central-1"
			
		    ]

}
# what t install , configure and file to copy/execute 
build {
	name=  "hq-packer"
	source = [
	  "source.amazon-ebs.ubuntu"
]

provisioner "file" {
source = "provisioner.sh"
destination = "/tmp/provisioner.sh"
}


# http://www.packer.io/docs/provisioners/shell 
provisioner "shell" {
	inline = ["chmod a+x /tmp/provisioner.sh"]
 }

 provisioner "shell" {
    inline = ["/tmp/provisioner.sh]
 }
}

















