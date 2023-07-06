variable "project" {
  type    = string
  default = "helloworld-391505"
}

variable "region" {
  type    = string
  default = "us-west1"
}

variable "vpc_cidr" {
  type    = string
  default = "10.88.0.0/16"
}

variable "subnet-ip_cidr_range" {
  type    = string
  default = "10.88.0.0/24"
}

variable "jenkins_address" {
  type    = string
  default = "jenkins"
}
variable "sonar_address" {
  type    = string
  default = "sonar"
}

variable "zone" {
  type    = string
  default = "us-west1-a"
}


variable "machine_type" {
  type    = string
  default = "n1-standard-1"
}


variable "instance_name" {
  type = list(any)
  default = [
    "jenkins",
    "sonarqube"
  ]
}

variable "image" {
  type    = list(any)
  default = ["helloworld-391505/jenkins", "centos-cloud/centos-7"]
}

variable "subnet_name" {
  type    = string
  default = "hello-subnet"
}

variable "vpc_name" {
  type    = string
  default = "hello-network"
}

variable "initial_node_count" {
  type    = number
  default = 1
}

variable "node_count" {
  type    = number
  default = 2
}
