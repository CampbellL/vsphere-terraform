variable "vsphere_user" {
    description = "The vSphere user"
    type        = string
}

variable "vsphere_password" {
    description = "The vSphere password"
    type        = string
    sensitive   = true
}

variable "vsphere_server" {
    description = "The vSphere server"
    type        = string
}