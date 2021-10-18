<img src="https://i.ibb.co/Pr2KmHg/uc-logo.png" height="110" alt="Usercentrics" />

# Usercentrics

<p align="left">
  <a href="https://github.com/Usercentrics/flutter-sdk/actions/workflows/ci.yml">
    <img alt="build and test status" src="https://github.com/Usercentrics/flutter-sdk/actions/workflows/ci.yml/badge.svg">
  </a>
</p>

## Overview

The Usercentrics Apps SDK is a native Consent Management Platform framework for mobile, TV and Unity applications, that enables the collection, documentation, and management of your user's privacy settings, in order to ensure legal compliance for different legal frameworks around the world.

<p align="center">
<img src="https://docs.usercentrics.com/cmp_in_app_sdk/latest/assets/media/predefinedUI.png" alt="Usercentrics UI" />
</p>

Our SDK consists of 2 main components:

**UsercentricsCore**
        Contains all core functionality to collect, document and manage consent, as well as usability features like language detection or geolocation. You may use this component by itself, if you are planing to build your own CMP.

**UsercentricsUI**
        UI Component that hooks to UsercentricsCore to provide a ready to use CMP solution. This component allows endless customization possibilities and is built to make A/B testing effortless.

### Supported Legal Frameworks

* 🇪🇺 GDPR - European Union's General Data Protection Regulation
* 🇺🇸 CCPA - California's Consumer Privacy Act
* 🇧🇷 LGPD - Brazil’s Lei Geral de Proteção de Dados
* 🌎 TCF 2.0 - Transparency & Consent Framework 2.0

### Supported Platforms

|               | Android | iOS |  Web  | tvOS | MacOS |
|:-------------:|:-------:|:---:|:-----:|:----:|:-----:|
| Core          |    ✅   |  ✅  |   ❌   |  ❌  |  ❌  |
| UI            |    ✅   |  ✅  |   ❌   |  ❌  |  ❌  |

### Requirements

* Dart 2: >= 2.12
* Flutter: >= 1.20
* iOS >= 11
* Android >= 4.1 (16)

### Features
* Easy installation via a package manager
* Methods to collect & update consent
* Up-to-date legal information on more than 1,000 technology vendors
* **UsercentricsUI** is a plug & play CMP solution with numerous customization options
* Build your own CMP with our **UsercentricsCore** module, an API that provides all necessary data and action delegates
* Device language detection
* tvOS and Android TV support only when building your own CMP
* Share the same settingsID between multiple apps and web applications
* Cross-Device consent sharing
* Consent continuity between an app and embedded WebViews. (Browser SDK is required)
* Offline Handling
* Reporting of service Opt-In rates
* Reporting of User Interactions

## Usage
TODO

## Get an Account
First step to get started with our SDK, is to create a Usercentrics Account, [get started with a free account](https://usercentrics.com/pricing/#mobile) or [request a quote](https://usercentrics.com/in-app-sdk/#in-app-demo) for your organization.

## Maintainers
- [Usercentrics](https://github.com/Usercentrics)