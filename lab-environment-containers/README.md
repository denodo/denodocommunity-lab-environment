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

It launches several containers as needed, initializing them using the files of the [lab-environment-sources](../lab-environment-sources/) subproject.

## Prerequisites

The Denodo Community Lab Environment Containers subproject is based on Docker, so you need to have Docker installed in your system to make these scripts to work.

### Docker
 
The first step is to install Docker based on your Operating System. You could download the appropriate version from the official site https://docs.docker.com/engine/install/. 

**Note**: Docker Compose version >= 2.20.2 is required (it is recommended to use [Compose V2](https://docs.docker.com/compose/migrate/))

Once downloaded, you could install and verify the version using the following command:

```bash
$ docker -v
Docker version 24.0.5, build ced0996

$ docker compose version
Docker Compose version v2.21.0
```
### Denodo Community Lab Environment project 

You also need the source files of the lab environment. For this, you have to clone this git repository: https://github.com/denodo/denodocommunity-lab-environment 

When you clone the repository, you’re simply making a copy of the repository from GitHub and saving it to the current directory of your machine.

```bash
$ git clone https://github.com/denodo/denodocommunity-lab-environment.git
```

You will have a directory structure like this:

```bash
$ tree
.
├── LICENSE
├── NOTICE
├── README.md
├── SUPPORT.md
├── lab-environment-containers
│   ├── build
│   │   ├── .env.template
│   │   └── docker-compose.yml
├── res
│   ├── denodo
│   │   └── vql
│   └── graphql
│       ├── application.properties
│       └── web.xml
├── lab-environment-sources
└── lab-environment-vm

```


# Usage

## Configuration

The Denodo Community Lab Environment is a `docker compose` script that comprises different environment variables that can be modified based on the requirement. The lab environment uses a standard docker environment file (`.env`) for configuration.

You have to make a copy of the `.env.template` file and rename it to `.env` and configure the values accordingly.

```bash
$ cd denodocommunity-lab-environment/lab-environment-containers/build/
$ cp .env.template .env
$ vi .env
```

In that file you can configure the hostname, IP address, and the port for connecting to each container **from your local machine**. Please note that the connection between containers is always done using the default (internal) ports. In the example below, if you launch a PostgreSQL container, you can connect from your machine using `localhost:5432`. But if you are trying to connect from other container, for example, a database client container, you should use the internal hostname and port, in this case `postgres:5432`

```properties
# Global network configuration
NET_SUBNET=172.30.0.0/24

# Postgresql (for Analytical database) 
# ====================================
ANALYTICAL_DB_HOSTNAME=postgres
ANALYTICAL_DB_PORT=5432
# INTERNAL PORT = 5432
...
```

## How to invoke the script

Once you have followed all the configuration steps (cloning the project and creating the .env file), you only have to run the following command:
```bash
$ docker compose -p training up
```

where:
* `-p training` refers to the docker project name. This parameter is **optional**. If you use it, you can use any label here. This is useful if you want to have multiple versions of the same lab environment. For example, one for training and another one for creating a personal project. For the rest of examples used in this README, we are going to omit this parameter but it is strongly recommended to use it.
* `up` refers to the command for building, creating and starting containers for the services configured. It aggregates the output of each container (logs), if you want to avoid that, simply add `--detach` or `-d` to start the containers in the background.

**Note**: you will notice that this command returns `"no service selected"` and no containers are started. This is the expected behavior because the project was configured for using specific docker profiles in order to start only the containers needed for your specific use case. Read the next sections of this README file to know how to use those profiles.

## Running containers using profiles 

Most of the time you won't need to start all the services configured in the docker compose YML file at the same time (because they will make use of some valuable resources -_cpu_ and _memory_- of your machine) so it is better to start only the containers required. This can be done using docker profiles. 

For example, for launching the data sources for training you can run the following command:

```bash
$ docker compose --profile ds up 
```
where:
* `--profile ds` refers to the profile name. The profiles help you to selectively start services. This is achieved by assigning each service to one or more profiles. 

In the table below you can find the list of available profiles that you can use (please note that using `--profile all` will start all the containers, which is not recommended!)

### List of available profiles

| Profile name | List of Containers |
| ----------- | ----------- | 
| ds | Profile for launching all these **Data Sources**: MariaDB, PostgreSQL, Tomcat, Apache, MongoDB and LDAP |
| ext-sso | Profile for launching a **Keycloak** server for Single Sign-On (including an LDAP server and a PostgreSQL* used as an external metadata database). |
| ext-git | Profile for launching a **GitLab** server for Version Control System. |
| util-mongo-express | Profile for launching **Mongo Express** as a web-based MongoDB administration interface. |
| util-graphql | Profile for launching **GraphQL Playground** as a web-based GraphQL client interface. |
| util-dbclient | Profile for launching **Cloudbeaver** as a web-based database administration interface. |
| all | Profile for launching all the available **Data Sources** and **External Servers**. |


## Running containers of different profiles at the same time

Sometimes you will need to start services from different profiles. For example, you may want to launch all the data sources and a Git server, in that case you can run the following command:

```bash
$ docker compose --profile ds --profile ext-git up 
```

## Stopping containers

If you want to stop the containers (without removing them) you only have to run the following command:
```bash
$ docker compose --profile ds stop
```
Using that command you can start the containers again using the command:
```bash
$ docker compose --profile ds start
```

## Removing containers

Alternatively you can use this other command for stopping **and removing** the containers and the associated network (if it is not used by any other container):
```bash
$ docker compose --profile ds down 
```
**Note:** You can add the option `--volumes` to this command to remove also the volumes defined for the containers. **DON'T USE THIS PARAM in case you want to maintain the changes done in the containers when you stop them!**

Once the containers are stopped or destroyed, if you want to start the containers again, you only have to run the usual command:
```bash
$ docker compose --profile ds up
```

# List of Denodo Common Lab Environment Containers

In the table below you can find the name of all the containers included by default in the docker compose script:


## Data Sources

| Service name | Container name | Image | Hostname | Description |
| ----------- | ----------- | ----------- | ----------- | ----------- |
| ds-tomcat | denodocommunity-lab-environment-tomcat | tomcat:8.5.47 | tomcat | **Apache Tomcat** server for deploying some Web services, including: *Sales WS*, *Product WS*. By default it is listening at http://localhost:8080/ |
| ds-postgresql | denodo-commonlab-postgres | postgres:12-alpine | postgres | **PostgreSQL** database. While running this container for the first time, the SQL files from the project directory will be executed and the fact tables of the TPC-DS data set will be imported. It is to be noted that this process only happens once. The default username and password will be `postgres`/`admin`. This container runs in the host **localhost** and port number **5432**. |
| ds-mariadb | denodocommunity-lab-environment-mariadb | mariadb:11.0.2 | mariadb | **MariaDB** database. While running this container for the first time, the SQL files from the project directory will be executed and the dimension tables of the TPC-DS data set will be imported. It is to be noted that this process only happens once. You can use `root`/`admin` as default user/password and **localhost:3306** as default host/port number for this data source. Data is persisted in the [project]_mariadb-common-lab volume. |
| ds-mongo | denodocommunity-lab-environment-mongo | mongo:6.0 | mongo | **MongoDB** NoSQL database initialized with a support data set. This server will be launched at host/port **localhost:27017** and the default credentials are `mongoadmin`/`admin`. |
| ds-httpd | denodocommunity-lab-environment-httpd | httpd:2.4.57 | webserver | **Apache HTTP** server which contains MS Excel, JSON and log files. By default it is listening at http://localhost:1080/ |


## External Services

| Service name | Container name | Image | Hostname | Description |
|---------|---------|---------|---------|------------|
| ext-apacheds | denodocommunity-lab-environment-apacheds | 1000kit/apacheds | ldapserver | **Apache Directory Services container**: Apache Directory Services is an extensible and embeddable directory server which has been certified as LDAPv3 compatible by the Open Group. The container consists of a predefined Denodo domain and some users. The default credentials for Apache DS is as follows: `uid=admin,ou=system` / `secret`. It uses by default the port **10389** |
| ext-keycloak | denodocommunity-lab-environment-keycloak | jboss/keycloak:13.0.0 | sso | **Keycloak container**: Keycloak is a Open Source Identity and Access Management tool. The container consists of a predefined realm for Denodo and it is connected to the **ext-apacheds** and **denodo-postgres** for user synchronization. The administration tool is listening at http://localhost:28443/ by default. Credentials: you can use the username `denodo` and password `denodo`. |
| denodo-postgres | denodocommunity-lab-environment-metadata | postgres:12-alpine | metadata | **PostgreSQL** database used as Keycloak external metadata database. The default username and password will be `denodo`/`denodo`. Data is persisted in the [project]_metadatadb-common-lab volume. |
| ext-git | denodocommunity-lab-environment-git | gitlab/gitlab-ce:16.2.8-ce.0 | gitlab | **GitLab container**: GitLab Community Edition (CE) is an open source end-to-end software development platform with built-in version control, issue tracking, code review, CI/CD, and more. This container runs a GitLab service to be used as the Version Control System for Denodo Platform. The administration console is running at http://localhost:1080/ by default |

## Utilities

| Service name | Container name | Image | Description |
|---------|---------|---------|------------|
| util-mongo-express | denodocommunity-lab-environment-mongo-express | mongo-express:latest | Web-based **MongoDB admin** interface, it is listening at http://localhost:8111/ by default. Use the following default credentials: `admin`/`pass`. |
| util-cloudbeaver | denodocommunity-lab-environment-cloudbeaver | dbeaver/cloudbeaver:23.2.2 | **Cloudbeaver container**: This container has CloudBeaver which is a web-based database management tool. This tool runs on http://localhost:8978/#/ |
| util-graphql-playground | denodocommunity-lab-environment-graphql-playground | imega/graphql-playground:latest | **GraphQL container**: GraphQL Playground is a graphical, interactive, in-browser GraphQL IDE. This is available at http://localhost:4000/graphql. |



# Licenses of the containers

The Denodo Community Lab Environment docker compose script downloads containers of third-party software (not managed by Denodo). Please know that those components are licensed under the following terms and conditions. Please refer to the specific software licenses:

* PostgreSQL: The PostgreSQL Licence https://www.postgresql.org/about/licence/
* MariaDB: GNU GPL 2 https://mariadb.com/kb/en/mariadb-licenses/
* MongoDB: Server Side Public License (SSPL) https://www.mongodb.com/licensing/server-side-public-license
* Apache Server: Apache License Version 2.0 https://www.apache.org/licenses/LICENSE-2.0
* Apache Tomcat: Apache License Version 2.0 https://www.apache.org/licenses/LICENSE-2.0
* Apache DS: Apache License Version 2.0 https://www.apache.org/licenses/LICENSE-2.0
* Keycloak: Apache License Version 2.0 https://www.apache.org/licenses/LICENSE-2.0
* GitLab CE: MIT License https://gitlab.com/gitlab-org/gitlab/-/blob/master/LICENSE
* Cloudbeaver Community: Apache License Version 2.0 https://www.apache.org/licenses/LICENSE-2.0
* GraphQL Playground: MIT License https://github.com/graphql/graphql-playground/blob/main/LICENSE


## Denodo Community Lab Environment License

This project is distributed under **Apache License, Version 2.0**. 

See [LICENSE](../LICENSE)

## Denodo Community Lab Environment Support

This project is supported by **Denodo Community**. 

See [SUPPORT](../SUPPORT.md)
