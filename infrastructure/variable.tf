variable project {
    type = string
    default = "helloworld-391505"
}

variable region {
    type = string
    default = "us-west1"
}




variable subnet-ip_cidr_range {
    type = string
    default = "192.168.1.0/24"
}


variable zone { 
    type = string
    default = "us-west1-a"
}


variable machine_type { 
    type = string 
    default = "n1-standard-1"
}



variable address_name { 
    type = string 
    default = "hello-ip"
}

variable instance_name { 
    type = string 
    default = "jenkins"
}

variable image { 
    type = string 
    default = "helloworld-391505/jenkins"
}

variable subnet_name { 
    type = string 
    default = "hello-subnet"
}

variable network_name { 
    type = string 
    default = "hello-network"
}