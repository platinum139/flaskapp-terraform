variable "ubuntu-ami" {
  description = "ubuntu-focal-20.04-amd64-server-20220627.1"
  type        = string
  default     = "ami-02f3416038bdb17fb"
}

variable "db-username" {
  type = string
}

variable "db-password" {
  type = string
}
