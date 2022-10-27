<img src="https://i.ibb.co/Pr2KmHg/uc-logo.png" height="110" alt="Usercentrics" />

# Usercentrics

<p align="left">
  <a href="https://github.com/Usercentrics/flutter-sdk/actions/workflows/ci.yml">
    <img alt="build and test status" src="https://github.com/Usercentrics/flutter-sdk/actions/workflows/ci.yml/badge.svg">
  </a>
  <a href="https://pub.dev/packages/usercentrics_sdk">
    <img alt="Version" src="https://img.shields.io/pub/v/usercentrics_sdk">
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

### Supported Legal Frameworks

* 🇪🇺 GDPR - European Union's General Data Protection Regulation
* 🇺🇸 CCPA - California's Consumer Privacy Act
* 🇧🇷 LGPD - Brazil’s Lei Geral de Proteção de Dados
* 🌎 TCF 2.0 - Transparency & Consent Framework 2.0

### Supported Platforms

| Android | iOS |  Web  | tvOS | MacOS |
|:-------:|:---:|:-----:|:----:|:-----:|
|    ✅   |  ✅  |   ❌   |  ❌  |  ❌  |

### Requirements

* Dart 2.17.1 or higher
* Flutter 1.20.0 or higher
* Android 4.1 (API 16) or higher with Kotlin 1.5 or higher
* iOS 11 or higher

To meet the requirements:

<details>
<summary>Android with Kotlin version lower than 1.5</summary>
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
<summary>Android version lower than 5.0 (API 21)</summary>
<p>

If you support an Android version lower than 5.0 (API 21) and you don't have the [multidex](https://developer.android.com/studio/build/multidex) enabled in your project, you may see the following error when you run your app on Android:

```
D8: Cannot fit requested classes in a single dex file (# methods: 66055 > 65536)
```

You can change the minimum version of your application to 5.0 (API 21). That configuration is usually in the `android/app/build.gradle` file. Make sure that `minSdkVersion` is `21` or higher.

![Multidex dependency](https://i.ibb.co/HXrzbWw/multidex-version.png)

Although Android 5.0 version already supports 99% of all devices, if you still want to have support for Android 4.1 (API 16) you have to do the following:

1. Add the multidex library to your application dependencies that is usually in the `android/app/build.gradle` file.

```groovy
implementation "androidx.multidex:multidex:2.0.1"
```

![Multidex dependency](https://i.ibb.co/m9Y0YKx/multidex-dep.png)

2. Enable the option in the application build `defaultConfig`. It is usually in the same `android/app/build.gradle` file.

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
<summary>iOS version lower than 11</summary>
<p>

If you have a iOS target version lower than **11** or you have no version at all (it defaults to version 9) you may see the following error when you run your app on iOS:

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

## Integration

Continue to our [documentation](https://docs.usercentrics.com/cmp_in_app_sdk/) for a step by step integration guide.

## Example

See the [example](https://github.com/Usercentrics/flutter-sdk/tree/master/example) directory for a complete sample app using Usercentrics.

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