variable "password-root" {
  type =  string
  default = "denodo"
  sensitive = true
}

variable "password-denodo" {
  type =  string
  default = "denodo"
  sensitive = true
}

variable "keyboard-layout" {
  type =  string
  default = "us"
}

variable "keyboard-variant" {
  type =  string
  default = "us"
}

variable "hostname" {
  type =  string
  default = "dqvm.local"
}

variable "home-path" {
  type =  string
  default = "/home/denodo"
}

variable "console-path" {
  type =  string
  default = "/opt"
}

locals {
  proj-name                    = "DENODO QUICKSTART VIRTUAL MACHINE"
  proj-short-name              = "DQVM"
  proj-user-guide	             = "https://github.com/denodo/denodocommunity-lab-environment/blob/master/lab-environment-vm/Denodo%20QuickStart%20Virtual%20Machine%20-%20User%20Manual.pdf"
  vm-name                      = "Denodo Quickstart Virtual Machine"
  vm-version                   = "2.1 (based on denodocommunity-lab-environment)"
  vm-memory                    = "8192"
  vm-cpus	                     = "4"
  base-iso-url                 = "https://dl-cdn.alpinelinux.org/alpine/v3.20/releases/x86_64/alpine-virt-3.20.0-x86_64.iso"
  base-iso-checksum            = "sha256:27cbb137dbf90c74856fb44f90488066c8bb7aee979365255c63ef925e1de521"
  base-iso-name                = "Alpine Linux 3.20"  
  user-root	                   = "root"
  user-denodo	                 = "denodo"
  lab-environment-url          = "https://github.com/denodo/denodocommunity-lab-environment.git"
  lab-environment-readme       = "https://github.com/denodo/denodocommunity-lab-environment/README.md"
  lab-environment-prj-name     = "denodocommunity-lab-environment"
  mngmnt-console-download-url  = "https://github.com/webmin/webmin/releases/download/2.105/webmin-2.105.tar.gz"
  mngmnt-console-name          = "webmin-2.105"
  mngmnt-console-url           = "http://<dqvm_ip_address>:10000/"
}
