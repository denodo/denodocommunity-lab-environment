<!--
title: 'Denodo Community Lab Environment Lang Files'
description: 'This project maintains the configuration scripts for the Denodo Community Lab Environment containers.
layout: Doc
framework: docker
platform: container
language: yml
authorLink: ''
authorName: 'Denodo Community'
authorAvatar: ''
collaborators: Jan Ulrich Maue
-->

# Language of the Denodo Data Catalog

The language of the Data Catalog is English by default. You can change the language of this web application. 

# Disclaimer

This project maintains language files uploaded by the Denodo Community of users. 

**Note:** For the official language packages provided by Denodo, please go to the Denodo User Manual: https://community.denodo.com/docs/html/browse/latest/en/platform/administration/language_of_the_web_tools/language_of_the_web_tools#changing-the-language-of-the-applications

# Install a Language File for Data Catalog

To change the default language of Data Catalog, follow these steps:

* Download the language file from this directory:
  * French: [customLang-fr.properties](./customLang-fr.properties)
  * Québec French: [customLang-fr_CA.properties](./customLang-fr_CA.properties)
  * Japanese: [customLang-ja.properties](./customLang-ja.properties)
  * Simplified Chinese: [customLang-zh_CN.properties](./customLang-zh_CN.properties)
  * German: [customLang-de.properties](./customLang-de.properties)
  * Spanish: [customLang-es.properties](./customLang-es.properties)
  * Italian: [customLang-it.properties](./customLang-it.properties)
  * Portuguese: [customLang-pt.properties](./customLang-pt.properties)
  * Catalan: [customLang-cat.properties](./customLang-cat.properties)

* Copy this file to `<DENODO_HOME>/work/data-catalog/`.

* Rename this file to `customLang.properties`.

* Edit the file `<DENODO_HOME>/conf/data-catalog/DataCatalogBackend.properties`, search the line with `customLang.langAttribute` and replace the entire line with one of these:
  * French: `customLang.langAttribute=fr`
  * Québec French: `customLang.langAttribute=fr_CA`
  * Japanese: `customLang.langAttribute=ja`
  * Simplified Chinese: `customLang.langAttribute=zh_CN`
  * German: `customLang.langAttribute=de`
  * Spanish: `customLang.langAttribute=es`
  * Italian: `customLang.langAttribute=it`
  * Portuguese: `customLang.langAttribute=pt`
  * Catalan: `customLang.langAttribute=cat`

* Restart Data Catalog.

# Collaborate translating Data Catalog to Other Languages

For others languages, the installation of the Denodo Platform includes a template file in English. This template contains key-value pairs like this one:

```properties
login.signIn=Sign in
```
You have to translate the value of each pair. In this example, translate `Sign in` to the required language.


Follow these steps to translate the user interface of Data Catalog:

* Copy the file `<DENODO_HOME>/resources/data-catalog/messages/customLang.properties.template` to a new file (or use the [English file](./customLang-en.properties) as template).

* Rename it to `customLang-<language ISO code>.properties`. See [ISO Language Codes](https://en.wikipedia.org/wiki/List_of_ISO_639_language_codes)

* Edit the file and translate the messages. Read the [documentation](https://community.denodo.com/docs/html/browse/latest/en/platform/administration/language_of_the_web_tools/language_of_the_web_tools#considerations-when-translating-the-language-files) for additional considerations. 

* Share it with the Denodo Community by submitting a Pull Request in this project :wink: