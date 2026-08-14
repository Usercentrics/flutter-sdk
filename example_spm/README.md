# usercentrics_example_spm

Sample app demonstrating `usercentrics_sdk` integration via **pure Swift
Package Manager** — no CocoaPods, no `pod install`, no Podfile-driven
dependencies at any point in this project's history.

Mirrors the functionality and UI of `example/`, with one deliberate
exception: the **consent mediation demo** was not ported here. That feature
depends on `pod 'FirebaseAnalytics'`, manually declared in
`example/ios/Podfile` — including it would reintroduce a CocoaPods
requirement and defeat the purpose of this app. See `example/` for the
mediation demo.

## What's included

- SDK init + status (`Initialize SDK`)
- First Layer / Second Layer banners
- Customization Example 1 & 2 (custom fonts/images, still just bundled assets
  — no native dependency)
- Custom UI (`build_your_own_ui.dart`)
- Webview integration (`webview_flutter` — resolves via SPM through
  `webview_flutter_wkwebview`, confirmed not to reintroduce CocoaPods)
- GPP testing

## Verifying the zero-CocoaPods claim

```bash
ls ios/Pods                              # should not exist
grep include ios/Flutter/Debug.xcconfig  # should only show Generated.xcconfig
cat ios/Flutter/ephemeral/Packages/FlutterGeneratedPluginSwiftPackage/Package.swift
# should list usercentrics_sdk (and webview_flutter_wkwebview) as SPM dependencies
```

## Setup

```bash
flutter config --enable-swift-package-manager
flutter pub get
flutter build ios --debug --no-codesign --simulator
open ios/Runner.xcworkspace   # no CocoaPods ever ran, but this workspace
                              # is Flutter's own default template output
```

`usercentrics_sdk` is a `path: ../` dependency, same convention as
`example/pubspec.yaml` — always builds against this repo's current SDK
source, not a published version.

## Context

`example/` can't prove the SDK works with zero CocoaPods, since it has
Firebase and other CocoaPods-only dependencies baked in for its own demo
purposes. This app fills that gap — a "customer builds a 100% SPM iOS app"
scenario. CI builds this app with SPM enabled and asserts no CocoaPods
artifacts appear (see `.github/workflows/ci.yml`, job `build-ios-spm-pure`).
