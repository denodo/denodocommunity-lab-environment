<!--
title: 'DQVM (Denodo Quickstart Virtual Machine)'
description: 'This project maintains the Denodo Quickstart Virtual Machine'
layout: Doc
framework: packer
platform: alpine-linux
language: hcl
authorLink: ''
authorName: 'Denodo Community'
authorAvatar: ''
collaborators: Victoria Margret, Ajay Kumar
-->

# DQVM (Denodo Quickstart Virtual Machine)

This subproject builds a Virtual Machine including the Denodo Community Lab Environment containers and all dependencies needed for launching that lab environment easily in your system. 

If you do not have Docker installed in your system, but you have a virtualization software like Hyper-V or VirtualBox, this is the resource you need for launching the data sources you need for completing the labs available in the Denodo Community, including the labs of the Denodo Training on-demand courses.

## Prerequisites

The Denodo Quickstart Virtual Machine (a.k.a. DQVM) can be launched in **VirtualBox, or Hyper-V** environments. You need that virtualization software installed to be able to import the virtual machine.

## Binaries 

You can download the latest version of the DQVM from the [Releases](https://github.com/denodo/denodocommunity-lab-environment/releases/latest) or you can build the DQVM by yourself following the steps below.

# Building the DQVM from sources
 
*__Note__: Skip this section if you have downloaded the DQVM binaries!*

If you need to make changes to the DQVM, feel free to build your own version of the Virtual Machine with your additions. Denodo Quickstart Virtual Machine builds are based on Packer, so the first step you need to do for building the DQVM is to install Packer in your system. You could read the official documentation of Packer at https://developer.hashicorp.com/packer/tutorials/docker-get-started/get-started-install-cli.

Once installed, you could verify the version using the following command:

```bash
$ packer -v
1.8.7
```

## Prerequisites

### Needed Plugins 

For creating the Virtual Machine, Packer uses some plugins which needs some dependencies to be installed on the system. For example, for using the VirtualBox provisioner, it needs Virtual Box to be installed in the system.

### Denodo Community lab-environment project 

You also need the source files of the lab environment. For this, you have to clone this git repository: https://github.com/denodo/denodocommunity-lab-environment 

When you clone the repository, you’re simply making a copy of the repository from GitHub and saving it to the current directory of your machine.

```bash
$ git clone https://github.com/denodo/denodocommunity-lab-environment.git
```

You will have a directory structure like this:

```bash
├── lab-environment-containers
├── lab-environment-sources
├── lab-environment-vm
│   ├── build
│   │   ├── dqvm.pkr.hcl
│   │   └── variables.pkr.hcl
│   ├── res
│   │   ├── update-issue
│   │   └── webmin.exp
│   ├── Denodo QuickStart Virtual Machine - User Manual.pdf
│   └── README.md
├── LICENSE
├── NOTICE
└── SUPPORT.md

```

The files needed to build the DQVM are located in the lab-environment-vm directory.

## Creating the DQVM

*__Note__: Skip this section if you have downloaded the DQVM binaries!*

### Prerequisites

Before building the virtual machines you need to configure your system in order to have the same network configuration in your machine and in the virtual machine.

#### Prerequisites for Hyper-V

The build file is using the Virtual Switch **"Default Switch"** as the default network so you have to ensure you have that swith enabled in the Hyper-V Virtual Switch Manager.

#### Prerequisites for Virtual Box

The build file is assuming you have a **"VirtualBox Host-Only Ethernet Adapter #2"** Host-only network created in your installation of Virtual Box. 

you can follow these steps to create it:
1. Configure the network by accessing the **Tools** option in VirtualBox.
2. Click on the button **Create** to create a new VirtualBox Host-Only Network.
3. After you click on this button you will see a new “VirtualBox Host-Only Ethernet Adapter” listed in this panel, rename it to **VirtualBox Host-Only Ethernet Adapter #2**
4. Configure the new adapter just by clicking over it and selecting the **Properties** option: select the option **Configure Adapter Manually** and add the following information:
    * IPv4 Address: 192.168.100.1
    * IPv4 Network Mask: 255.255.255.0
5. Inside the configuration of the adapter, open the **DHCP Server** tab and configure the following:
    * Select Enable Server
    * Server Address: 192.168.100.2
    * Server Mask: 255.255.255.0
    * Lower Address Bound: 192.168.100.3
    * Upper Address Bound: 192.168.100.254

### Building the DQVM

To launch the build using Packer, you can run the packer build command followed by the name of the configuration file (dqvm.pkr.hcl). Here are the commands you can use:

```bash
$ cd denodocommunity-lab-environment/lab-environment-vm/build
$ packer init .
$ packer build -force .
```
**Note:** you may need administrator privileges to run this command in your system.

When you run this command, Packer will start the build process based on the instructions defined in the dqvm.pkr.hcl configuration file. It will download the Guest OS ISO, boot the image using the boot commands, create a virtual machine, execute the defined provisioners (such as running scripts, copying files or installing packages), and generate the output artifacts based on the specified post-processors (for example, a ".ova" box in the case of VirtualBox).

During the build process, you'll see logs indicating the progress of each step, including any errors or warnings that may occur. Once the build process completes successfully, you will find the generated VM file in the specified output directories (output-base in our example).

Note that the build process may take some time to complete, depending on your hardware and internet connection speed.

```bash
$ packer build -force .
virtualbox-iso.base: output will be in this color.

==> virtualbox-iso.base: Retrieving Guest additions
==> virtualbox-iso.base: Trying C:\Program Files\Oracle\VirtualBox/VBoxGuestAdditions.iso
==> virtualbox-iso.base: Trying file://C:/Program%20Files/Oracle/VirtualBox/VBoxGuestAdditions.iso
==> virtualbox-iso.base: file://C:/Program%20Files/Oracle/VirtualBox/VBoxGuestAdditions.iso => C:/Program Files/Oracle/VirtualBox/VBoxGuestAdditions.iso
==> virtualbox-iso.base: Retrieving ISO
==> virtualbox-iso.base: Trying https://dl-cdn.alpinelinux.org/alpine/v3.18/releases/x86_64/alpine-virt-3.18.0-x86_64.iso
[...]
==> virtualbox-iso.base: Deregistering and deleting VM...
Build 'virtualbox-iso.base' finished after 2 minutes 49 seconds.

==> Wait completed after 2 minutes 49 seconds

==> Builds finished. The artifacts of successful builds are:
--> virtualbox-iso.base: VM files in directory: output-base
```

# Importing the DQVM

Once you have downloaded or created the DQVM, you have to import it into your virtualization system (VirtualBox, Hyper-V). You can follow the instructions of the [DQVM User Manual](Denodo%20QuickStart%20Virtual%20Machine%20-%20User%20Manual.pdf)

## Denodo Community Lab Environment License

This project is distributed under **Apache License, Version 2.0**. 

See [LICENSE](../LICENSE)

## Denodo Community Lab Environment Support

This project is supported by **Denodo Community**. 

See [SUPPORT](../SUPPORT.md)