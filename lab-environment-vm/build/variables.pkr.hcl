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
  proj-user-guide	             = "http://"
  vm-name                      = "Denodo Quickstart Virtual Machine"
  vm-version                   = "2.0 (based on denodocommunity-lab-environment)"
  vm-memory                    = "4096"
  vm-cpus	                     = "2"
  base-iso-url                 = "https://dl-cdn.alpinelinux.org/alpine/v3.18/releases/x86_64/alpine-virt-3.18.0-x86_64.iso"
  base-iso-checksum            = "sha256:a28ec4931e2bd334b22423baac741c5a371046d0ad8da9650e6c4fcde09e4504"
  base-iso-name                = "Alpine Linux 3.18"  
  user-root	                   = "root"
  user-denodo	                 = "denodo"
  lab-environment-url          = "https://github.com/denodo/denodocommunity-lab-environment.git"
  lab-environment-readme       = "https://github.com/denodo/denodocommunity-lab-environment/README.md"
  lab-environment-prj-name     = "denodocommunity-lab-environment"
  mngmnt-console-download-url  = "https://github.com/webmin/webmin/releases/download/2.105/webmin-2.105.tar.gz"
  mngmnt-console-name          = "webmin-2.105"
  mngmnt-console-url           = "http://<dqvm_ip_address>:10000/"
}
