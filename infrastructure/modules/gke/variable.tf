variable "project_id" {
    type = string
    default = "hello-392203"
}
variable "region" {
    type = string
    default = "us-central1"
}
variable "cluster_name" {
    type = string
    default = "helloworld"
}
variable "zone" {
    type = string
    default = "us-central1-a"
}
variable "machine_type" {
    type = string
    default = "e2-small"
}
variable "team" {
    type = string
    default = "devops"
}
variable "remove_default_node_pool" {
    type = bool
    default = true
}
variable "initial_node_count" {
    type = number
    default = 1
}





