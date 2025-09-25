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
collaborators: 
-->

# Language of the Scheduler Web Admin

The language of the Denodo Scheduler Web Admin is English by default. You can change the language of this web application. 

# Disclaimer

This project maintains language files uploaded by the Denodo Community of users. 

**Note:** For the official language packages provided by Denodo, please go to the Denodo User Manual: https://community.denodo.com/docs/html/browse/latest/en/platform/administration/language_of_the_web_tools/language_of_the_web_tools#changing-the-language-of-the-applications

## Install a Language File for Denodo Scheduler Web Admin

To change the default language of Denodo Scheduler Web Admin, follow these steps:

* Download the language file from this directory:
  * Japanese: [customLang-ja.properties](./customLang-ja.properties)

* Copy this file to `<DENODO_HOME>/work/scheduler-webadmintool/customization/`.

* Rename this file to `customLang.properties`.

* Edit the file `<DENODO_HOME>/conf/scheduler-webadmintool/ConfigurationParameters.properties`, search the line with `customLang.langAttribute` and replace the entire line with one of these:
  * Japanese: `customLang.langAttribute=ja`

* Restart Design Studio.


# Collaborate translating Denodo Scheduler Web Admin to Other Languages

For others languages, the installation of the Denodo Platform includes a template file. This template contains key-value pairs like this one:

```properties
login.signIn=Sign in
```
You have to translate the value of each pair. In this example, translate `Sign in` to the required language.

Follow these steps to translate the user interface of the Denodo Scheduler Web Admin:

* Copy the file `<DENODO_HOME>/resources/scheduler-webadmintool/messages/customLang.properties.template` to a new file (or use the [English file](./customLang-en.properties) as template).

* Rename it to `customLang-<language ISO code>.properties`. See [ISO Language Codes](https://en.wikipedia.org/wiki/List_of_ISO_639_language_codes)

* Edit the file and translate the messages. Read the [documentation](https://community.denodo.com/docs/html/browse/latest/en/platform/administration/language_of_the_web_tools/language_of_the_web_tools#considerations-when-translating-the-language-files) for additional considerations. 

* Share it with the Denodo Community by submitting a Pull Request in this project :wink: