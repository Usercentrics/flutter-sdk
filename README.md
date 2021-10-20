<img src="https://i.ibb.co/Pr2KmHg/uc-logo.png" height="110" alt="Usercentrics" />

# Usercentrics

<p align="left">
  <a href="https://github.com/Usercentrics/flutter-sdk/actions/workflows/ci.yml">
    <img alt="build and test status" src="https://github.com/Usercentrics/flutter-sdk/actions/workflows/ci.yml/badge.svg">
  </a>
  <a href="https://github.com/Usercentrics/flutter-sdk/releases">
    <img alt="Version" src="https://img.shields.io/badge/version-2.0.1-blue">
  </a>
  <a href="https://twitter.com/intent/follow?screen_name=usercentrics">
    <img src="https://img.shields.io/twitter/follow/usercentrics?style=social&logo=twitter"
            alt="follow on Twitter">
  </a>
</p>

## Overview

The Usercentrics Apps SDK is a Consent Management Platform framework for mobile, TV, Web, and Unity applications, that enables the collection, documentation, and management of your user's privacy settings, in order to ensure legal compliance for different legal frameworks around the world.

<p align="center">
<img src="https://docs.usercentrics.com/cmp_in_app_sdk/latest/assets/media/predefinedUI.png" alt="Usercentrics UI" />
</p>

Our SDK consists of 2 main components:
- **UsercentricsCore**. Contains all core functionality to collect, document and manage consent, as well as usability features like language detection or geolocation. You may use this component by itself, if you are planing to build your own CMP.
- **UsercentricsUI**. UI Component that hooks to UsercentricsCore to provide a ready to use CMP solution. This component allows endless customization possibilities and is built to make A/B testing effortless.

### Supported Legal Frameworks

* 🇪🇺 GDPR - European Union's General Data Protection Regulation
* 🇺🇸 CCPA - California's Consumer Privacy Act
* 🇧🇷 LGPD - Brazil’s Lei Geral de Proteção de Dados
* 🌎 TCF 2.0 - Transparency & Consent Framework 2.0

### Supported Platforms

|                  | Android | iOS |  Web  | tvOS | MacOS |
|:----------------:|:-------:|:---:|:-----:|:----:|:-----:|
| UsercentricsCore |    ✅   |  ✅  |   ❌   |  ❌  |  ❌  |
| UsercentricsUI   |    ✅   |  ✅  |   ❌   |  ❌  |  ❌  |

### Requirements

* Dart 2: >= 2.12
* Flutter: >= 1.20
* iOS: >= 11
* Android: >= 4.1 (16)

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

1. Add Usercentrics to your project:

```bash
flutter pub add usercentrics_sdk
```

2. Add the import wherever you want to use it:

```dart
import 'package:usercentrics_sdk/all.dart';
```

3. Initialize Usercentrics with your configuration **only once** in the life of the application:

```dart
// e.g place this inside the [initState] of the Entry Point Widget
Usercentrics.initialize(
  settingsId: 'XXxXXxXX',
);
```

You have to [get an account](#get-an-account) in order to get your `settingsId`. You can use `Yi9N3aXia` to demo.

4. Get the consent status of the user via `UsercentricsReadyStatus`:

```dart
try {
  final status = await Usercentrics.status;
  if (status.shouldShowCMP) {
    // Collect Consent
  } else {
    // Apply consent with status.consents
  }
} catch (error) {
  // Handle non-localized error
}
```

5. Present the UsercentricsUI in order to collect consent:

```dart
void showCMP() async {
  try {
    final response = await Usercentrics.showCMP();
    // Apply consent with response.consents
  } catch (error) {
    // Handle non-localized error
  }
}
```

6. To know how to apply consent properly, restore user session, inject session to a webview, and much more, visit our [documentation website](https://docs.usercentrics.com/cmp_in_app_sdk).

## Troubleshooting

<details>
<summary>[Android] Incompatible Kotlin Version</summary>
<p>

If you have an incompatible Kotlin version you may see the following error when you run app on Android:

```
e: Incompatible classes were found in dependencies. Remove them from the classpath or use '-Xskip-metadata-version-check' to suppress errors
```

This error is easy to solve, you only need to increase the version that is usually in the `android/build.gradle` file. Use a recent stable Kotlin version, for example: `1.5.31`.

![build.gradle](https://i.ibb.co/vBv9Tcy/kotlin-version.png)

</p>
</details>  

<details>
<summary>[Android] Multidex</summary>
<p>

If you support Android 5.0 or older devices and you don't have the [multidex](https://developer.android.com/studio/build/multidex) enabled in your project, you may see the following error when you run your app on Android:

```
D8: Cannot fit requested classes in a single dex file (# methods: 66055 > 65536)
```

This error is easy to solve, you have to do the following:

1. Add the multidex library to your application dependencies that is usually in the `android/app/build.gradle` file.

```groovy
implementation "androidx.multidex:multidex:2.0.1"
```

![Multidex dependency](https://i.ibb.co/m9Y0YKx/multidex-dep.png)

2. Enable the option in the application build `defaultConfig`. It is usually in the same `android/app/build.gradle` file.
Use a recent stable Kotlin version, for example: `1.5.31`.

```groovy
multiDexEnabled true
```

![Multidex enabled](https://i.ibb.co/9pHd0DS/multidex-enabled.png)

3. Make your application class initialize multidex. There are several options to do that, in Flutter the easiest way is to add it to the manifest. The manifest is usually located at `android/app/src/main/AndroidManifest.xml`.

```groovy
android:name="androidx.multidex.MultiDexApplication"
```

![Multidex application](https://i.ibb.co/41zFWt5/multidex-application.png)

</p>
</details>

<details>
<summary>[iOS] Incompatible Target Version</summary>
<p>

If you have a iOS target version older than **11** or you have no version at all (it defaults to version 9) you may see the following error when you run your app on iOS:

```
[!] Automatically assigning platform `iOS` with version `9.0` on target `Runner` because no platform was specified. Please specify a platform for this target in your Podfile. See `https://guides.cocoapods.org/syntax/podfile.html#platform`.
```

This error is easy to solve, you have to do the following:

1. Define or increase the version of your Podfile at least to version 11. It is usually located at `ios/Podfile`.

```ruby
platform :ios, '11.0'
```

![Podfile](https://i.ibb.co/rxScM0n/ios-target-podfile.png)

2. Run `flutter pub get` again and open the iOS project using Xcode. It is usually located at `ios/Runner.xcworkspace`. Now, you have to select the `Runner` project and change the `Deployment Target` to the same version.

![Xcode Project](https://i.ibb.co/CJ6tRq3/ios-target-project.png)

</p>
</details>

## Testing

You can use your own Usercentrics to test the integration or any other functionality. 

1. Implement your own `UsercentricsPlatform` manually or using a mock library such as `mockito`:

```dart
class FakeUsercentrics extends UsercentricsPlatform {
  ...
}
```

2. Inject your instance in the testing `delegatePackingProperty` variable:

```dart
testWidgets('Initializes Usercentrics', (WidgetTester tester) async {
  final usercentrics = FakeUsercentrics();
  Usercentrics.delegatePackingProperty = usercentrics;

  await tester.pumpWidget(const MyApp());

  expect(usercentrics.initializeCount, 1);
});
```

3. Clear the instance after the test in order to prevent the tests from interfering with each other:
```dart
tearDown(() {
  Usercentrics.delegatePackingProperty = null;
});
```

## Get an Account
First step to get started with our SDK, is to create a Usercentrics Account, [get started with a free account](https://usercentrics.com/pricing/#mobile) or [request a quote](https://usercentrics.com/in-app-sdk/#in-app-demo) for your organization.

## Maintainers
- [Usercentrics](https://github.com/Usercentrics)