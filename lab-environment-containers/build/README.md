<!--
title: 'Denodo Community Lab Environment Containers'
description: 'This project maintains the configuration scripts for the Denodo Community Lab Environment containers.
layout: Doc
framework: docker
platform: container
language: yml
authorLink: ''
authorName: 'Denodo Community'
authorAvatar: ''
collaborators: Victoria Margret, Ajay Kumar, Sarath Chandran
-->

# Denodo Community Lab Environment Containers

This subproject maintains the Docker Compose scripts for launching a local testing environment with Denodo and other external services used as data sources. You can use it for Denodo training, for testing purposes or a base for your projects.

It launches several containers as needed, initializing them using the files of the [lab-environment-sources](../../lab-environment-sources/) subproject.

# Basic Configuration

The Denodo Community Lab Environment is a `docker compose` script that comprises different environment variables that can be modified based on the requirement. The lab environment uses a standard docker environment file (`.env`) for configuration.

You have to make a copy of the `.env.template` file and rename it to `.env` and configure the values accordingly.

```bash
$ git clone https://github.com/denodo/denodocommunity-lab-environment.git
$ cd denodocommunity-lab-environment/lab-environment-containers/build/
$ cp .env.template .env
$ vi .env
```

And start the containers using a specific profile, for example:

```bash
$ docker compose --profile ds up 
```

## List of available profiles

| Profile name | List of Containers |
| ----------- | ----------- | 
| ds | Profile for launching these **Data Sources**: MariaDB, PostgreSQL, Tomcat, Apache HTTP, MongoDB, and LDAP. And this **Application**: GraphQL client. |
| denodo | Profile for launching these **Denodo servers and tools**: Virtual DataPort server, Design Studio, Data Catalog, and a PostgreSQL* database to be used as external metadata and cache database. |
| denodo-sched | Profile for launching **Denodo Scheduler**: it includes a Denodo Scheduler server, a Denodo Index server, and the Scheduler Web Administration Tool. |
| ai | Profile for launching **Denodo AI SDK**: it includes the Denodo AI SDK\*\*, a Virtual DataPort server, Data Catalog, Design Studio and a PostgreSQL\* database to be used as cache database. |
| sso | Profile for launching a **Keycloak** server that can be used to test Single Sign-On in Denodo (it includes an LDAP server and a PostgreSQL* used as an external metadata database). |
| notebook | Profile for launching a **JupyterLab** notebook that can be used to test a Python client for connecting to Denodo. |
| git | Profile for launching a **GitLab** server that can be used testing Version Control System with Denodo. |
| util-mongo-express | Profile for launching **Mongo Express** as a web-based MongoDB administration interface. |
| util-graphql | Profile for launching **GraphQL Playground** as a web-based GraphQL client interface. |
| util-dbclient | Profile for launching **Cloudbeaver** as a web-based database administration interface. |
| all | Profile for launching all the available containers (**We strongly recommend not to use this profile**). |

\* The associated container for this PostgreSQL database is shared among all the Denodo servers and Keycloak.

\*\* You need to configure your LLM Infrastructure in the .env file to use it 

## Running containers of different profiles at the same time

Sometimes you will need to start services from different profiles. For example, you may want to launch teh Denodo Platform and the data sources, in that case you can run the following command:

```bash
$ docker compose --profile ds --profile notebook up 
```

# Advanced Configuration

The `.env` file allows you to configure your containers. Find below the most common actions you will do:

## Change the hostnames of the containers

For each container you will find a property `***_HOSTNAME` that you can update with your preferred name.

For example, for the Apache HTTP container:

```properties
# Apache HTTP 
# ===========
HTTPSERVER_HOSTNAME=webserver
...
```

Please note that the connection between containers is always done using this hostname.

## Change the ports of the containers

For each container you will find a property (or several properties) `***_EXTERNAL_PORT` that you can update with your preferred port.

For example, for the Apache HTTP container:

```properties
# Apache HTTP 
# ===========
...
HTTPSERVER_EXTERNAL_PORT=1080
# INTERNAL PORT = 80
...
```

Please note that the connection between containers is always done using the default (internal) port. For that reason, there's no option to modify that internal port in this project.

You can modify the **external port**, which is the port used for connecting to the container **from your local machine**. Please ensure that the configured port is not used in your local machine, otherwise you won't be able to connect to the container.

 In our example, launching the Apache HTTP container:
 * You can connect from your local machine to the Apache HTTP container using the url `http://localhost:1080/` (the external port configured in the `.env` file). 
 * You can connect from one container (for example, from a Denodo Platform container) to the Apache HTTP container using the hostname and the internal port, in our case `http://webserver:80/` (or `http://webserver/`)

## Configuration of Denodo containers

### Configure the Denodo License

For using the Denodo containers, you need a valid Denodo license. If you don't have one, you can download a Denodo Express licese which is free forever. Just go to the Denodo Community Site (https://community.denodo.com/express/) and download your license. 

Furthermore, in the `.env` file you have to configure the path to the Denodo license you have downloaded (`DENODO_SA_LIC` parameter). If for example, you have downloaded the license file to `/home/denodo/my_denodo_license.lic`, you have to edit the `.env` file this way:

```properties
# Full Path to your Denodo Standalone license file
DENODO_SA_LIC=/home/denodo/my_denodo_license.lic
```

### Configure the Denodo version

In the `.env` file you can configure a specific version of Denodo Platform in the `DENODO_VERSION` parameter. You can also specify the version of the Denodo AI SDK (in the `DENODO_AI_SDK_VERSION` parameter).

> **Note:** Denodo Express installations can only use the `latest` version of the Denodo containers

#### Denodo Platform

```properties
# For Denodo Customers:     DENODO_VERSION=harbor.open.denodo.com/denodo-9/images/denodo-platform:latest
# For Denodo Express Users: DENODO_VERSION=harbor.open.denodo.com/denodo-express/denodo-platform:latest
DENODO_VERSION=harbor.open.denodo.com/denodo-express/denodo-platform:latest
```

For example, if you have a Denodo subscription license, you can use this to launch a Denodo 9.2.1 container:

```properties
DENODO_VERSION=harbor.open.denodo.com/denodo-9/images/denodo-platform:9.2.1
```

#### Denodo AI SDK
```properties
# For Denodo Customers:     DENODO_AI_SDK_VERSION=harbor.open.denodo.com/denodo-connects-9/images/ai-sdk:latest
# For Denodo Express Users: DENODO_AI_SDK_VERSION=harbor.open.denodo.com/denodo-express/ai-sdk:latest
DENODO_AI_SDK_VERSION=harbor.open.denodo.com/denodo-express/ai-sdk:latest
```

For example, if you have a Denodo subscription license, you can use this to use the version v0.8.1 of the Denodo AI SDK:

```properties
DENODO_AI_SDK_VERSION=harbor.open.denodo.com/denodo-connects-9/images/ai-sdk:v0.8.1
```
**Note: Running the Denodo AI SDK container**: In case you want to try the Denodo AI SDK, please read the [Building an AI Chatbot with Denodo in Minutes](https://community.denodo.com/tutorials/browse/chatbot/index) tutorial, which explains how to use a specific environment with some precreated views in Denodo to be used by the AI SDK and the Sample Chatbot.


### Configure the Language of the Denodo web tools

The folder [custom-lang](../res/denodo/files/custom-lang/) of this project contains the localization files of the Denodo web applications. 

You can edit the `***_LANG` property to use one of the configured languages (English is the default language).

```properties
# Language of the Web Tools
# =============================
DENODO_DS_CUSTOM_LANG_DIR=../res/denodo/files/custom-lang/design-studio
DENODO_DS_CUSTOM_LANG=en
DENODO_DC_CUSTOM_LANG_DIR=../res/denodo/files/custom-lang/data-catalog
DENODO_DC_CUSTOM_LANG=en
```

For example, if inside the folder `../res/denodo/files/custom-lang/design-studio` you have these files:
* customLang-de.properties
* customLang-fr.properties
* customLang-ja.properties

You can configure this to have the Design Studio in French:
```properties
DENODO_DS_CUSTOM_LANG=fr
```

Of course, you can add more languages! You can simply add new files in these directories, following the documentation:
* [Design Studio](../res/denodo/files/custom-lang/design-studio/README.md) 
* [Data Catalog](../res/denodo/files/custom-lang/data-catalog/README.md) 