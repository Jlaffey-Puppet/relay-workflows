locals {
  # Workaround for https://github.com/hashicorp/terraform/issues/15966
  workspace-settings = {
    file = "workspace.${terraform.workspace}.tfvars.json"

    defaults = {
	    vpc_id = "vpc-568bb233"
	    aws_region = "us-west-1"
      key_name = ""
    }
  }

  workspace = "${merge(local.workspace-settings.defaults, jsondecode(fileexists(local.workspace-settings.file) ? file(local.workspace-settings.file) : "{}"))}"
}

variable "ec2_machine_type" {
  description = "EC2 machine type"
  default = "t2.micro"
}

variable "ec2_ami" {
  description = "EC2 machine type"
#  default = "ami-02df9ea15c1778c9c"
  default = "ami-06ef55d9f960fba96"	
	
}

variable "ec2_disk_size" {
  description = "EC2 disk size in GB"
  default = "20"
}
