
terraform {
  source = "${get_terragrunt_dir()}"
}

remote_state {
  backend = "s3"
  config = {
    bucket  = "project-78bf2621-6ba3-4cd7-963a-058179ce0ef9-us-east-1"
    key     = "ghjhgj/terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
    dynamodb_table = "project-78bf2621-6ba3-4cd7-963a-058179ce0ef9-us-east-1"
  }
}

generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF

terraform {
  backend "s3" {
    bucket  = "project-78bf2621-6ba3-4cd7-963a-058179ce0ef9-us-east-1"
    key     = "project-78bf2621-6ba3-4cd7-963a-058179ce0ef9-us-east-1/terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
    dynamodb_table = "project-78bf2621-6ba3-4cd7-963a-058179ce0ef9-us-east-1"
  }
}
EOF
}

inputs = {
  allowed_cidr_blocks = ["0.0.0.0/0","192.168.1.0/24"]
  availability_zones = ["ap-south-1a","ap-south-1b"]
  aws_region = "ap-south-1"
  disk_sizes = ["8","16","32"]
  ec2_ami_id = "ami-0522ab6e1ddcc7055"
  ec2_security_group_name = "allow-ssh-http"
  ec2_subnet_id = "subnet-01f3ef012620e408a"
  enable_monitoring = "false"
  enable_public_ip = "true"
  instance_count = 1
  instance_types = ["t2.micro","t3.micro"]
  key_name = "outroom"
  max_retries = 5
  port_mappings = {"http":"80","https":"443"}
  project_environment = {"environment":"dev","project":"alpha"}
  project_tags = {"environment":"dev","project":"alpha"}
  resource_limits = ["1024","MB","true"]
  tags = {"Environment":"production","Name":"terraform-instance"}
  user_data_script = "#!/bin/bash\\necho 'Hello World!'"
  vpc_config = {"cidr_block":"10.0.0.0/16","enable_dns_support":"true","subnets":"[\"10.0.1.0/24\", \"10.0.2.0/24\"]"}
  vpc_id = "vpc-0fbad5b11bc87230b"
}
