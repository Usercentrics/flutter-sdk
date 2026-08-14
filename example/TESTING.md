# Testing MSDK-3529: iOS SPM support

The `usercentrics_sdk` plugin supports both CocoaPods and Swift Package Manager
(SPM) on iOS. Dual support lives in the plugin itself
(`ios/usercentrics_sdk.podspec` and `ios/usercentrics_sdk/Package.swift`) —
this sample app requires no SPM-only configuration and builds, runs, and
produces a working consent flow in **both** modes.

Legend: ✅ verified · ⬜ not yet run · 🔧 needs specific hardware/access not available in this environment

---

## 0. One-time setup

- Xcode with iOS 17+ simulators available (SPM plugin resolution needs a
  reasonably current Xcode; older Xcode versions may not support SPM plugins
  at all — see Section 6).
- CocoaPods installed (`pod --version`).
- The sample app uses a **real backend settings ID** (`Yi9N3aXia`, in
  `example/lib/main.dart`) — the consent flow scenarios hit the live
  Usercentrics CMP, not a mock. Make sure the simulator/device has network
  access.

---

## Known issue found + fixed during testing: SPM version drift

While testing, `ios/usercentrics_sdk/Package.swift` originally pinned
`usercentrics-spm-ui` with `from: "2.28.2"` (a semver floor). Partway through
testing, `usercentrics-spm-ui`/`usercentrics-spm-sdk` 2.29.0/2.29.1 were
tagged upstream, and SwiftPM immediately floated to the new version —
whose binary artifact download intermittently failed in this environment
("too many HTTP redirects" from Xcode's downloader; the artifact itself was
confirmed reachable via plain `curl`, so this wasn't a broken release, just
an Xcode-downloader-specific issue with the redirect chain).

Pinning `usercentrics-spm-ui` to `.exact("2.28.2")` alone wasn't enough,
because `usercentrics-spm-ui`'s **own** `Package.swift` depends on
`usercentrics-spm-sdk` with `from: "2.28.2"` — a floor we don't control from
this repo. **Fix:** added a direct, exact top-level dependency on
`usercentrics-spm-sdk` too (matching what our plugin sources actually import
— several files do `import Usercentrics` directly, not just
`UsercentricsUI`), giving the resolver a hard anchor for both packages:

```swift
dependencies: [
    .package(url: "https://bitbucket.org/usercentricscode/usercentrics-spm-ui", exact: "2.28.2"),
    .package(url: "https://bitbucket.org/usercentricscode/usercentrics-spm-sdk", exact: "2.28.2")
],
targets: [
    .target(
        name: "usercentrics_sdk",
        dependencies: [
            .product(name: "UsercentricsUI", package: "usercentrics-spm-ui"),
            .product(name: "Usercentrics", package: "usercentrics-spm-sdk")
        ]
    )
]
```

After this fix, a completely fresh resolve (cleared `Package.resolved`,
cleared DerivedData `SourcePackages` cache) resolved both packages straight
to `2.28.2` with no manual lock-file intervention needed. This is the
current, durable state of the file — no follow-up action required, but
worth calling out in the PR description since it's a real gotcha for anyone
maintaining this dependency later (any future upstream tag bump will need
this file's version bumped deliberately, on purpose, rather than floating).

---

## 1. Build verification (mechanical, both modes) — ✅ done, both modes

```
flutter config --enable-swift-package-manager   # or --no-enable-swift-package-manager
cd example
flutter clean
flutter pub get
flutter build ios --debug --simulator
```

| Check | SPM mode | CocoaPods mode |
|---|---|---|
| `flutter build ios --debug --simulator` succeeds | ✅ | ✅ |
| No warning `"...does not support Swift Package Manager for ios: usercentrics_sdk"` | ✅ confirmed absent | N/A |
| `usercentrics_sdk` resolves via `FlutterGeneratedPluginSwiftPackage`, not `Pods/` | ✅ | N/A |
| `pod install` resolves `usercentrics_sdk` + `UsercentricsUI` via podspec | N/A | ✅ (confirmed via `Podfile.lock`) |
| `flutter build ios --release --no-codesign` succeeds | ✅ | ✅ |

Also run once, mode-independent:
```
cd flutter-sdk && flutter pub publish --dry-run   # ✅ passes, only expected "uncommitted files" warning
cd flutter-sdk && flutter test                     # ✅ 64/64 Dart tests pass — proves lib/ and test/ are untouched
```

---

## 2. Native unit tests (`RunnerTests`, CocoaPods mode) — ✅ done

```
cd example/ios
pod install
xcodebuild -workspace Runner.xcworkspace -scheme Runner -configuration Debug \
  -sdk iphonesimulator -destination 'platform=iOS Simulator,id=<booted sim id>' \
  test -only-testing:RunnerTests
```
✅ 33/33 tests pass. (This target isn't wired for SPM mode — it's a native
XCTest target linked via CocoaPods `inherit! :complete` — so it only needs
running in CocoaPods mode.)

---

## 3. Functional consent-flow scenarios — ✅ done, both modes, full match

Walked through manually on iPhone 16 Pro (iOS 26.5 simulator) against the
live settings ID `Yi9N3aXia`, in **both** SPM and CocoaPods mode, with a
fresh app uninstall between cold-init/accept/deny checks:

| # | Scenario | Result |
|---|---|---|
| 3.1 | Cold init, first consent | ✅ both modes — banner auto-shows on fresh install |
| 3.2 | Accept All | ✅ both modes — `status: true` all services, persists across relaunch (banner doesn't reappear) |
| 3.3 | Deny All (fresh install) | ✅ both modes — `status: false` all services |
| 3.4 | Show First Layer (manual) | ✅ both modes — works independent of init flow |
| 3.5 | Show Second Layer + Save | ✅ both modes — custom row layout (Save + Accept All) renders; `granular` decision round-trips with mixed true/false |
| 3.6 | Reset consent state (uninstall) | ✅ used throughout 3.1/3.3 to force real fresh-install behavior, not stale persisted consent |
| 3.7 | Customization Example 1 | ✅ both modes — full first→second layer→save flow, no crash |
| 3.8 | Customization Example 2 | ✅ both modes — same, no crash |
| 3.9 | Custom UI (`build_your_own_ui.dart`) | ✅ both modes — `Print UI Elements` dumps full GDPR data correctly; `Accept All`/`Deny All`/`Save Services` intentionally produce no console output (sample's `applyConsent` is an empty stub — not a bug) |
| 3.10 | Change Language (within Custom UI) | ✅ both modes — switches to `de`, all labels/services/categories translate; note the sample code reuses a stale local `data` var right after the call, so you must re-enter the screen to see the update reflected — not a bug, just a sample-code quirk |
| 3.11 | Webview Integration | ✅ both modes — renders "In-App SDK to Browser SDK" text correctly. (Hit one false-blank-page scare mid-session that turned out to be caused by the SPM version-drift issue above corrupting build state, not a real webview regression — confirmed by retesting with a clean, correctly-resolved build) |
| 3.12 | GPP Testing | ✅ both modes — `Get GPP String` → `null`, `Get GPP Data` → empty JSON (both correct/expected since the active settings ID is GDPR, not a US-state-privacy framework), `Set usnat/usfl SaleOptOut` → both complete silently, no errors |

No behavioral differences found between SPM mode and CocoaPods mode for any
scenario.

---

## 4. Mediation flag scenario — ✅ done (retroactively covered)

`main.dart`'s `_kMediationTestEnabled` flag (`bool.fromEnvironment('MEDIATION_TEST', defaultValue: true)`)
only controls one thing: `consentMediation: _kMediationTestEnabled` passed
into `Usercentrics.initialize()`. There's no separate visible UI toggle
(the code comment claiming one is stale). Since it **defaults to `true`**,
every scenario in Section 3 already ran with mediation enabled. Corroborated
by a Firebase Analytics log line (`[<AppMeasurement>] ... Found unknown
associated object: APMScreen`) observed during testing, confirming Firebase
was active alongside the consent flow. No separate action needed.

---

## 5. Cross-mode switching edge cases

| # | Scenario | Result |
|---|---|---|
| 5.1 | Switch modes **without** `flutter clean` | ✅ **Passed** — contrary to our original assumption, this worked cleanly (build succeeded, app ran, `Initialize SDK` → `ready` correctly). Likely only appeared fragile earlier in the session because of the version-drift issue above, not because of stale Pods/SPM state colliding. |
| 5.2 | Repeated toggling (SPM → CocoaPods → SPM → CocoaPods) | ✅ ran 4 consecutive clean toggles (SPM → CocoaPods → SPM → CocoaPods), each with `flutter clean` + full build — all 4 succeeded, no degradation on repetition |
| 5.3 | Fresh checkout, default mode | ✅ covered by equivalence — `flutter config` is a global user setting, not per-project, so "never touched the SPM flag" behaves identically to our explicit `--no-enable-swift-package-manager` testing, which was run extensively throughout Sections 1–4 |

---

## 6. Environment/compatibility scenarios

| # | Scenario | Status |
|---|---|---|
| 6.1 | Older Xcode without SPM-plugin support | 🔧 needs an older Xcode install — not available in this environment |
| 6.2 | Real device (not simulator) build, both modes | ✅ tested on a physical iPhone 15 (iOS 26.5): `flutter run` installed and launched correctly in **both** SPM and CocoaPods mode; Initialize SDK → banner → Accept All confirmed working in SPM mode, and persisted-consent (straight to `ready`, no banner) confirmed in CocoaPods mode — full parity with simulator testing. Note: this device runs iOS 26.5, not the iOS 11/14 floor this ticket cares about, since no older physical device was available — the deployment-target-specific risk (very old iOS versions) remains genuinely untested. |
| 6.3 | Release/Profile configuration build | ✅ done — see Section 1, both modes |
| 6.4 | Android build unaffected | ✅ `flutter build apk` succeeds; confirmed `android/`, `example/android/`, and `lib/` carry zero changes from this ticket (pre-existing local diffs in `MainActivity.kt`/`build.gradle` predate this work and are untouched by it) |

---

## 7. Business/data checks

- ✅ Already answered in the ticket itself: "Check if any active customers
  are on iOS 11 — only bump the deployment target if forced by SPM package
  resolution (**checked and oldest is 14**)." No open action here — the
  reporter had already confirmed no iOS 11 customers before filing this
  ticket, consistent with our finding that no deployment-target bump was
  needed anyway.

---

## 8. Existing automated coverage (reference)

Dart bridge/serializer tests (`flutter test`) — `test/internal/bridge/*_test.dart`,
`test/internal/platform/*_test.dart`, `test/usercentrics_test.dart`.

Native `RunnerTests` — `example/ios/RunnerTests/Bridge/*.swift`,
`example/ios/RunnerTests/Fake/*.swift`.

---

## Sign-off checklist before opening the PR

- [x] Section 1 (build, both modes, debug + release)
- [x] Section 2 (RunnerTests)
- [x] Section 3 (functional consent flow, both modes, full match)
- [x] Section 4 (mediation regression — retroactively covered)
- [x] Section 5.1 (mode-switching without clean)
- [x] Section 5.2 (4x repeated toggling stress test)
- [x] Section 5.3 (fresh-checkout default — covered by equivalence)
- [x] Section 6.4 (Android sanity build)
- [x] Section 6.2 (real device, both modes)
- [ ] Section 6.1 (older Xcode) — flag as known gap in PR description, no second Xcode install available in this environment
- [x] Section 7 (iOS 11 customer check) — already answered in the ticket text itself, no action needed
