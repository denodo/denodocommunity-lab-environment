<!--
title: 'Denodo Community Lab Environment Data Sources'
description: 'This project maintains the configuration scripts for the data sources used in the Denodo Community Lab environment which is the base environment for all the labs and exercises included in the Technical Resources available in the Denodo Community Site (tutorials, training courses, etc.).'
layout: Doc
framework: 
platform: 
language: sql, csv, json
authorLink: ''
authorName: 'Denodo Community'
authorAvatar: ''
collaborators: Victoria Margret, Ajay Kumar
-->

# Denodo Community Lab Environment Data Sources

This subproject mantains the configuration scripts for creating a set of different data sources in order to build a local testing environment that can be used later for Denodo training, for testing purposes or a base for your projects.

It contains scripts and files for different types of data sources, like databases, web services, plain files, etc.

# Download files

## Denodo Community Lab Environment project 

For downloading the data source files, you have to clone this git repository: https://github.com/denodo/denodocommunity-lab-environment 

When you clone the repository, you’re simply making a copy of the repository from GitHub and saving it to the current directory of your machine.

```bash
$ git clone https://github.com/denodo/denodocommunity-lab-environment.git
```

You will have a directory structure like this:

```bash
├── lab-environment-containers
├── lab-environment-sources
│   ├── res
│   │   ├── db
│   │   ├── denodo
│   │   ├── files
│   │   ├── ldap
│   │   ├── sso
│   │   └── war
│   └── README.md
├── lab-environment-vm
├── LICENSE
├── NOTICE
└── SUPPORT.md
```

Each directory has the files for the specific data source:

| data source | vendor | databases | files |
| ----------- | ----------- | ----------- | ----------- | 
| database | PostgreSQL | tpc_ds, human_resources, website_sys, historical_orders | [db/postgresql-init.sql](res/db/postgresql-init.sql) |
| database | MariaDB | tpc_ds, calltracking, sales (tutorial), crm | [db/mariadb-init.sql](res/db/postgresql-init.sql) |
| denodo monitor logs | Denodo | vdp-queries, vdp-queryblocks | [denodo-monitor/logs/](res/denodo/files/tools/monitor/denodo-monitor/logs/) |
| binary files | MS Excel | invoices, marketing promotions | [files/excel/](res/files/excel/) |
| plain text files | - | logs | [files/logs/](res/files/logs/) |
| LDIF files | ApacheDS | users, groups | [ldap/](res/ldap/) |
| NoSQL | mongodb | product, support | [nosql/](res/nosql/) |
| Realm configuration | Keycloak | realm, users, groups | [sso/](res/sso/) |
| Web services | Tomcat | billing, product, sales (ws) | [war/](res/war/) |

## Denodo Community Lab Environment License

This project is distributed under **Apache License, Version 2.0**. 

See [LICENSE](../LICENSE)

## Denodo Community Lab Environment Support

This project is supported by **Denodo Community**. 

See [SUPPORT](../SUPPORT.md)
