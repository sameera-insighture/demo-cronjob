variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "ap-south-1"
}

variable "ec2_ami_id" {
  description = "EC2 AMI ID"
  type        = string
  default     = "ami-0522ab6e1ddcc7055"
}

variable "instance_count" {
  description = "Number of instances to launch"
  type        = number
  default     = 1
}

variable "ec2_subnet_id" {
  description = "EC2 subnet ID"
  type        = string
  default     = "subnet-01f3ef012620e408a"
}

variable "enable_public_ip" {
  description = "Enable public IP"
  type        = bool
  default     = true
}

variable "key_name" {
  description = "Key pair name"
  type        = string
  default     = "outroom"
}

variable "project_environment" {
  description = "Project environment"
  type        = map(string)
  default     = {
    project      = "alpha"
    environment  = "dev"
  }
}

variable "project_tags" {
  description = "Project tags"
  type        = map(string)
  default     = {
    project      = "alpha"
    environment  = "dev"
  }
}

variable "ec2_security_group_name" {
  description = "Security group name to allow SSH and HTTP"
  type        = string
  default     = "allow-ssh-http"
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
  default     = "vpc-0fbad5b11bc87230b"
}

variable "availability_zones" {
  description = "List of availability zones"
  type        = list(string)
  default     = ["ap-south-1a", "ap-south-1b"]
}

variable "instance_types" {
  description = "Set of instance types"
  type        = set(string)
  default     = ["t2.micro", "t3.micro"]
}

variable "disk_sizes" {
  description = "Disk sizes for EBS volumes"
  type        = list(number)
  default     = [8, 16, 32]
}

variable "user_data_script" {
  description = "User data script for EC2 instances"
  type        = string
  default     = "#!/bin/bash\necho 'Hello World!'"
}

variable "enable_monitoring" {
  description = "Enable detailed monitoring"
  type        = bool
  default     = false
}

variable "port_mappings" {
  description = "Port mappings for ECS tasks"
  type        = map(number)
  default     = {
    http  = 80
    https = 443
  }
}

variable "vpc_config" {
  description = "Nested VPC configuration"
  type        = object({
    cidr_block        = string
    enable_dns_support = bool
    subnets           = list(string)
  })
  default = {
    cidr_block        = "10.0.0.0/16"
    enable_dns_support = true
    subnets           = ["10.0.1.0/24", "10.0.2.0/24"]
  }
}

variable "resource_limits" {
  description = "Resource limits as a tuple"
  type        = tuple([number, string, bool])
  default     = [1024, "MB", true]
}

variable "allowed_cidr_blocks" {
  description = "List of allowed CIDR blocks"
  type        = list(string)
  default     = ["0.0.0.0/0", "192.168.1.0/24"]
}

variable "tags" {
  description = "Tags for AWS resources"
  type        = map(string)
  default     = {
    Name        = "terraform-instance"
    Environment = "production"
  }
}

variable "max_retries" {
  description = "Maximum number of retries"
  type        = number
  default     = 5
}
