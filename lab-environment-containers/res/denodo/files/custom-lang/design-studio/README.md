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

# Language of the Denodo Design Studio

The language of the Denodo Design Studio is English by default. You can change the language of this web application. 

# Disclaimer

This project maintains language files uploaded by the Denodo Commuity of users. For the official language packages, please go to the Denodo User Manual: https://community.denodo.com/docs/html/browse/latest/en/platform/administration/language_of_the_web_tools/language_of_the_web_tools#install-a-language-file-for-design-studio

## Install a Language File for Denodo Design Studio

To change the language of Denodo Design Studio, follow these steps:

* Download the language file from this directory:
  * Japanese: [customLang-ja.properties](./customLang-ja.properties)
  * Simplified Chinese: [customLang-zh_CN.properties](./customLang-zh_CN.properties)
  * German: [customLang-de.properties](./customLang-de.properties)

* Copy this file to `<DENODO_HOME>/work/design-studio/`.

* Rename this file to `customLang.properties`.

* Edit the file `<DENODO_HOME>/conf/design-studio/DesignStudioBackend.properties`, search the line with `customLang.langAttribute` and replace the entire line with one of these:
  * Japanese: `customLang.langAttribute=ja`
  * Simplified Chinese: `customLang.langAttribute=zh_CN`
  * German: `customLang.langAttribute=de`

* Restart Design Studio.


# Collaborate translating Design Studio to Other Languages

For others languages, the installation of the Denodo Platform includes a template file. This template contains key-value pairs like this one:

```properties
login.signIn=Sign in
```
You have to translate the value of each pair. In this example, translate `Sign in` to the required language.

Follow these steps to translate the user interface of Design Studio:

* Copy the file `<DENODO_HOME>/resources/design-studio/messages/customLang.properties.template` to a new file.

* Rename it to `customLang-<language ISO code>.properties`. See [ISO Language Codes](https://en.wikipedia.org/wiki/List_of_ISO_639_language_codes)

* Edit the file and translate the messages. Read the [documentation](https://community.denodo.com/docs/html/browse/latest/en/platform/administration/language_of_the_web_tools/language_of_the_web_tools#considerations-when-translating-the-language-files) for additional considerations. 

* Share it with the Denodo Community :wink: