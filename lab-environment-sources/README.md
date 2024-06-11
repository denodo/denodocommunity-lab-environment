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

This subproject maintains the configuration scripts for creating a set of different data sources in order to build a local testing environment that can be used later for Denodo training, for testing purposes or a base for your projects.

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
│   │   |   ├── excel
│   │   |   ├── json
│   │   |   └── logs
│   │   ├── ldap
│   │   ├── nosql
│   │   |   └── mongodb
│   │   ├── sso
│   │   └── war
│   └── README.md
├── lab-environment-vm
├── LICENSE
├── NOTICE
└── SUPPORT.md
```

Each directory has the files for the specific data source:

| Data source | Vendor | Data sets | Path |
| ----------- | ----------- | ----------- | ----------- | 
| database | PostgreSQL | tpc_ds, human_resources, website_sys, historical_orders | [db/postgresql-init.sql](res/db/postgresql-init.sql) |
| database | MariaDB | tpc_ds, calltracking, sales (tutorial), crm | [db/mariadb-init.sql](res/db/postgresql-init.sql) |
| denodo monitor logs | Denodo | vdp-queries, vdp-queryblocks | [denodo-monitor/logs/](res/denodo/files/tools/monitor/denodo-monitor/logs/) |
| Binary files | MS Excel | invoices, marketing promotions, zipcodes | [files/excel/](res/files/excel/) |
| Delimited files | - | logs | [files/logs/](res/files/json/) |
| JSON files | - | household demographics | [files/json/](res/files/logs/) |
| LDIF files | ApacheDS | users, groups | [ldap/](res/ldap/) |
| NoSQL | MongoDB | product, support | [nosql/](res/nosql/) |
| Realm configuration | Keycloak | realm, users, groups | [sso/](res/sso/) |
| Web services | Tomcat | billing, product, sales (ws) | [war/](res/war/) |


## License

### Denodo Community Lab Environment License

This project is distributed under the **Apache License, Version 2.0**. 

See [LICENSE](../LICENSE)

### Licenses of the data sets

Some Denodo Community Lab Environment Sources are based on third-party projects (not managed by Denodo). Please know that those data sets are licensed under the following terms and conditions. Please refer to the specific software licenses:

* **Human_resources** dataset: it is based on https://github.com/oracle-samples/db-sample-schemas, licensed under the MIT License https://github.com/oracle-samples/db-sample-schemas/blob/main/LICENSE.txt 
* **tpc_ds** dataset: it is based on the [TPC-DS](http://www.tpc.org/tpcds/) database benchmark. The data set included is a small part of a full dataset generated using the tpcds dsdgen script 

Other data sets not listed here have been created by Denodo and are licensed under the **Apache License, Version 2.0** license, see [LICENSE](../LICENSE)

## Denodo Community Lab Environment Support

This project is supported by **Denodo Community**. 

See [SUPPORT](../SUPPORT.md)
