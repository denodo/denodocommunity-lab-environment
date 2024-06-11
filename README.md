<!--
title: 'Denodo Community Lab Environment'
description: 'This project maintains some sample data sources that can be used to build a local testing environment of different technologies that can be used later for Denodo training, for testing purposes or for having a base for your Denodo projects.
layout: Doc
authorLink: ''
authorName: 'Denodo Community'
authorAvatar: ''
collaborators: Victoria Margret, Ajay Kumar, Sarath Chandran
-->

# Denodo Community Lab Environment

[Denodo](https://www.denodo.com/) is the leading logical data management platform. It establishes a unified data accessibility framework that provides data consumers with real-time insights from diverse data sources.

This project maintains some sample data sources that can be used to build a local testing environment of different technologies that can be used later for Denodo training, for testing purposes or for having a base for your Denodo projects.

## Getting started

To get started, you’ll need to grab the code. If you are familiar with Git, just open a command prompt and execute this command:

```bash
git clone https://github.com/denodo/denodocommunity-lab-environment.git
```

Our recommendation is to launch the data sources as Docker [Containers](./lab-environment-containers/). In order to run the containers, you must [have Docker installed](https://www.docker.com/community-edition#/download).

If you don't have the option of using Docker, then we provide an alternative way by means of downloading a [Virtual Machine](./lab-environment-vm/) already configured with all the dependencies needed to run the containers (the VM is available for Hyper-V or VirtualBox).

In case you don't have a VirtualBox of Hyper-V environment, you are still able to use a local installation of the data sources that you can initialize using the scripts provided in the [Data Sources](./lab-environment-sources/) subproject.

Please read the documentation of each subproject to get more information: 

* [Denodo Community Lab Environment Containers](./lab-environment-containers/README.md)
* [Denodo Community Lab Environment Data Sources](./lab-environment-sources/README.md)
* [Denodo Community Lab Environment Virtual Machines](./lab-environment-vm/README.md)

# Join the Denodo Community

- Star the repo
- Join the [Denodo Community](https://community.denodo.com/) and ask questions on the [Q&A](https://community.denodo.com/answers)
- Download [Denodo Express](https://community.denodo.com/express/download)
- [Contributions](https://github.com/denodo/denodocommunity-lab-environment/contribute) are, of course, most welcome! 
- Track [issues](https://github.com/denodo/denodocommunity-lab-environment/issues/new/choose) 

## Denodo Community Lab Environment License

This project is distributed under **Apache License, Version 2.0**. 

See [LICENSE](LICENSE)

## Denodo Community Lab Environment Support

This project is supported by **Denodo Community**. 

See [SUPPORT](SUPPORT.md)

