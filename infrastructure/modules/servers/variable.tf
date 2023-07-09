variable "project_id" {
  type    = string
  default = "hello-392203"
}

variable "region" {
  type    = string
  default = "us-central1"
}

variable "zone" {
  type    = string
  default = "us-central1-a"
}

variable "jenkins_address" {
  type    = string
  default = "jenkins"
}
variable "sonar_address" {
  type    = string
  default = "sonar"
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
  type    = string
  default = "centos-cloud/centos-7"
}





