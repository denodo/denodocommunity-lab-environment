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

This project maintains language files uploaded by the Denodo Community of users. 

**Note:** For the official language packages provided by Denodo, please go to the **Denodo Platform Administration Guide**: https://community.denodo.com/docs/html/browse/latest/en/platform/administration/language_of_the_web_tools/language_of_the_web_tools#changing-the-language-of-the-applications

## Install a Language File for Denodo Design Studio

To change the default language of Denodo Design Studio, follow these steps:

* Download the language file from this directory:
  * Japanese: [customLang-ja.properties](./customLang-ja.properties)
  * Simplified Chinese: [customLang-zh_CN.properties](./customLang-zh_CN.properties)
  * German: [customLang-de.properties](./customLang-de.properties)

* If you are logged in to Design Studio, log out first.

* Go to the Preferences page of Design Studio (i.e. https://denodo-server.acme.com:9443/denodo-design-studio/#/web-local-login)

* Click the menu `Configuration > Application settings`.

* In the section `Language`, select the `Default language` and click `Add language` to upload the file of the languages you want to make available to the users.

* * After uploading the language files, they will be available to all the users immediately. That is, once a user logs in, the application will display on the top-right side of the screen a “globe” icon in which the user will be able to choose the preferred language file.

## Alternative way (for Denodo Design Studio versions prior to 9.3)

* Download the language files and copy them to `<DENODO_HOME>/work/design-studio/`.

* The Design Studio determines the application language checking if a language file exists that exactly matches the user’s preferred browser language. 
  * If no specific language file is found for the user’s preferred languages, the application uses the language defined in customLang.properties (if it exists. If not, the application will default to English).

* Restart Design Studio.

### If you want a language other than English to be the default language

* Download the language files and copy them to `<DENODO_HOME>/work/design-studio/`.
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

* Copy the file `<DENODO_HOME>/resources/design-studio/messages/customLang.properties.template` to a new file (or use the [English file](./customLang-en.properties) as template).

* Rename it to `customLang-<language ISO code>.properties`. See [ISO Language Codes](https://en.wikipedia.org/wiki/List_of_ISO_639_language_codes)

* Edit the file and translate the messages. Read the [documentation](https://community.denodo.com/docs/html/browse/latest/en/platform/administration/language_of_the_web_tools/language_of_the_web_tools#considerations-when-translating-the-language-files) for additional considerations. 

* Share it with the Denodo Community by submitting a Pull Request in this project :wink: