packer {
  required_plugins {
    virtualbox = {
      version = "~> 1"
      source = "github.com/hashicorp/virtualbox"
    }

	hyperv = {
      source  = "github.com/hashicorp/hyperv"
      version = "~> 1"
    }
  }
}

source "hyperv-iso" "base" {
  vm_name       = "${local.vm-name}"
  iso_url       = "${local.base-iso-url}"
  iso_checksum  = "${local.base-iso-checksum}"
  memory		= "${local.vm-memory}"
  cpus			= "${local.vm-cpus}"
  first_boot_device  = "IDE"
  switch_name   = "Default Switch"
  boot_wait     = "10s"
  boot_command  = [
					"root<enter><wait>",  				
					"setup-alpine<enter><wait5>",
					"${var.keyboard-layout}<enter><wait>",
					"${var.keyboard-variant}<enter><wait>",
					"${var.hostname}<enter><wait>",
					"eth0<enter><wait>",
					"dhcp<enter><wait5>",
					"n<enter><wait5>",
					"${var.password-root}<enter><wait>",
					"${var.password-root}<enter><wait>",
					"UTC<enter><wait5>",
					"none<enter><wait5>",
					"openntpd<enter><wait5>",
					"Q<wait>1<enter><wait5>",
					"${local.user-denodo}<enter><wait>",
					"${local.user-denodo}<enter><wait>",
					"${var.password-denodo}<enter><wait>",
					"${var.password-denodo}<enter><wait>",
					"none<enter><wait>",
					"openssh<enter><wait15>",
					"sda<enter><wait10>",
					"sys<enter><wait30>",
					"y<enter><wait45>",											
					"reboot<enter><wait30>",
					"${local.user-root}<enter><wait>", 
					"${var.password-root}<enter><wait>", 
					"echo 'PermitRootLogin yes' >> /etc/ssh/sshd_config<enter><wait>",	
					"service sshd restart<enter><wait>",
					"apk add hvtools<enter><wait10>",
					"rc-service hv_fcopy_daemon start<enter><wait5>",
					"rc-update add hv_fcopy_daemon<enter><wait>",
					"rc-service hv_kvp_daemon start<enter><wait5>",
					"rc-update add hv_kvp_daemon<enter><wait>",
					"rc-service hv_vss_daemon start<enter><wait5>",
					"rc-update add hv_vss_daemon<enter><wait>"
            ]
  ssh_username  = "${local.user-root}"
  ssh_password  = "${var.password-root}"
  shutdown_command = "poweroff"
}

source "virtualbox-iso" "base" {
  vm_name       = "${local.vm-name}"
  iso_url       = "${local.base-iso-url}"
  iso_checksum  = "${local.base-iso-checksum}"
  guest_os_type = "Linux_64"
  guest_additions_mode = "disable"
  export_opts = [ "--manifest",
  				  "--vsys", "0",
                  "--description", "${local.vm-name}",
                  "--version", "${local.vm-version}"]
  format        = "ova" 
  memory		= "${local.vm-memory}"
  cpus			= "${local.vm-cpus}"
  vboxmanage    = [["modifyvm", "{{.Name}}", "--paravirt-provider",  "kvm"],	
				   ["modifyvm", "{{.Name}}", "--graphicscontroller", "vmsvga"],	
				   ["modifyvm", "{{.Name}}", "--vram",               "20"],			   
				   ["modifyvm", "{{.Name}}", "--vrde",               "off"],
				   ["modifyvm", "{{.Name}}", "--nic1",               "nat"],
				   ["modifyvm", "{{.Name}}", "--nic2",               "hostonly"],
				   ["modifyvm", "{{.Name}}", "--nic-type2",          "82540EM"],
				   ["modifyvm", "{{.Name}}", "--hostonlyadapter2",   "VirtualBox Host-Only Ethernet Adapter #2"]]
  boot_wait     = "10s"
  boot_command  = [
					"root<enter><wait>",  				
					"setup-alpine<enter><wait5>",
					"${var.keyboard-layout}<enter><wait>",
					"${var.keyboard-variant}<enter><wait>",
					"${var.hostname}<enter><wait>",
					"eth0<enter><wait>",
					"dhcp<enter><wait5>",
					"eth1<enter><wait>",
					"dhcp<enter><wait5>",
					"n<enter><wait5>",
					"${var.password-root}<enter><wait>",
					"${var.password-root}<enter><wait>",
					"UTC<enter><wait5>",
					"none<enter><wait5>",
					"c<enter><wait5>",
					"1<enter><wait5>",					
					"${local.user-denodo}<enter><wait>",
					"${local.user-denodo}<enter><wait>",
					"${var.password-denodo}<enter><wait>",
					"${var.password-denodo}<enter><wait>",
					"none<enter><wait>",
					"openssh<enter><wait15>",
					"sda<enter><wait10>",
					"sys<enter><wait30>",
					"y<enter><wait45>",										
					"reboot<enter><wait30>",
					"${local.user-root}<enter><wait>", 
					"${var.password-root}<enter><wait>", 
					"echo 'PermitRootLogin yes' >> /etc/ssh/sshd_config<enter><wait>",	
					"service sshd restart<enter><wait5>",
					"apk add virtualbox-guest-additions<enter><wait10>"
            ]
  ssh_username  = "${local.user-root}"
  ssh_password  = "${var.password-root}"
  shutdown_command = "poweroff"
}

build {
  name = "build-dqvm"

  sources = [
	"source.hyperv-iso.base",
	"source.virtualbox-iso.base"
  ]

  provisioner "file" {
	source = "../res/update-issue"
	destination = "/etc/network/if-up.d/update-issue"
  }

  provisioner "file" {
	source = "../res/webmin.exp"
	destination = "/tmp/webmin.exp"
  }

  provisioner "shell" {
    inline = [
	    "echo '***** Updating Repositories'",
	  	"apk update",		
		
		"echo '***** Updating Packages'",
		"apk upgrade",
		
		"echo '***** Add denodo to sudoers'",
		"apk add sudo",
		"echo '%wheel ALL=(ALL) ALL' > /etc/sudoers.d/wheel",
		"adduser denodo wheel",
		
		"echo '***** Installing New Packages (ACF)'",
		"setup-acf",
		"apk add acf-openssh",		
		
		"echo '***** Installing Denodo Community Lab Environment'",
		"apk add git docker docker-compose docker-cli-compose",
		"rc-update add docker boot",
		"service docker start",	
		"cd ${var.home-path}",
		"git clone ${local.lab-environment-url}",
		"chown -R ${local.user-denodo}:${local.user-denodo} ${local.lab-environment-prj-name}",
		"cd ${local.lab-environment-prj-name}/lab-environment-containers/build",
		"cp .env.template .env",
		"cd ${var.home-path}",
		
		"echo '***** Installing Management Console'",
		"apk add perl perl-dev perl-net-ssleay perl-app-cpanminus build-base expect procps",
		"cpanm IO::Pty",
		"cd ${var.console-path}",
		"wget ${local.mngmnt-console-download-url}",
		"tar -xvzf ${local.mngmnt-console-name}.tar.gz > /dev/null",
		"ln -sf ${var.console-path}/${local.mngmnt-console-name} ${var.console-path}/console",

		"echo '========================'",
		"echo '         TESTS'",
		"echo '========================'",
		"git --version",
		"docker -v",
		"docker compose version",

		"echo '========================'",		
		"echo 'Additional Configuration'",
		"echo '========================'",
		"echo '' > /etc/motd",
		"echo 'Welcome to the ${local.proj-name}!' >> /etc/motd",
		"echo '' >> /etc/motd",
		"echo 'This virtual machine contains the software needed to use the Denodo Community Lab Environment.' >> /etc/motd", 
		"echo 'The project is avilable in this path:' >> /etc/motd", 
		"echo '' >> /etc/motd",
		"echo '    ${var.home-path}/${local.lab-environment-prj-name}' >> /etc/motd", 
		"echo '' >> /etc/motd",
		"echo 'For launching the training data sources please execute these commands:' >> /etc/motd", 
		"echo '' >> /etc/motd",
		"echo '    cd ${var.home-path}/${local.lab-environment-prj-name}/lab-environment-containers/build' >> /etc/motd", 
		"echo '    docker compose -p training --profile ds up' >> /etc/motd", 
		"echo '' >> /etc/motd",
		"echo -n '${local.lab-environment-prj-name} documentation: ' >> /etc/motd",
		"echo -en '\\033[4;36m' >> /etc/motd",
		"echo -n '${local.lab-environment-readme}' >> /etc/motd",
		"echo -en '\\033[0m' >> /etc/motd",
		"echo '' >> /etc/motd",
		"echo '' >> /etc/motd",
		"echo -n '${local.proj-short-name} User Manual: ' >> /etc/motd",
		"echo -en '\\033[4;36m' >> /etc/motd",
		"echo -n '${local.proj-user-guide}' >> /etc/motd",
		"echo -en '\\033[0m' >> /etc/motd",
		"echo '' >> /etc/motd",		
		"echo '' >> /etc/motd",
		
		"echo -en '\\033[0;32m' > /etc/issue",
		"echo ' ${local.proj-name}' >> /etc/issue",
		"echo '  _____     ____   __      __  __  __' >> /etc/issue",
		"echo ' |  __ \\\\   / __ \\\\  \\\\ \\\\    / / |  \\\\/  |' >> /etc/issue",
		"echo ' | |  | | | |  | |  \\\\ \\\\  / /  | \\\\  / |' >> /etc/issue",
		"echo ' | |  | | | |  | |   \\\\ \\\\/ /   | |\\\\/| |' >> /etc/issue",
		"echo ' | |__| | | |__| |    \\\\  /    | |  | |' >> /etc/issue",
		"echo ' |_____/   \\\\___\\\\_\\\\     \\\\/     |_|  |_|' >> /etc/issue",
		"echo '' >> /etc/issue",
		"echo ' Version: ${local.vm-version}' >> /etc/issue",
		"echo -en '\\033[0m' >> /etc/issue",
		"echo '' >> /etc/issue",
		"echo ' Running on:' >> /etc/issue",
		"echo '    ${local.base-iso-name}' >> /etc/issue",
		"echo '    Kernel \\r on an \\m' >> /etc/issue",
		"echo ' ' >> /etc/issue",		
		"chmod a+x /etc/network/if-up.d/update-issue",		
		"echo 'DONE! DQVM created succesfully!'",

		"cd ${var.console-path}",
		"/usr/bin/expect /tmp/webmin.exp",
		"rc-update add webmin default",
		"reboot"
    ]
  }

}
