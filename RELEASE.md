# Release process

How to cut a release of this package (`usercentrics_sdk`). Written after doing
the 2.29.1 release by hand; keep it updated when the process changes.

## 1. Where the version lives

The version number must be bumped **consistently** in all of these files —
grep for the previous version string across the repo to be sure you didn't
miss one:

- `pubspec.yaml` — `version:` field (the Dart/Flutter package version)
- `android/build.gradle` — `usercentrics_version` variable. This is used both
  as the Android library's own version **and** as the version pin for the
  native `com.usercentrics.sdk:usercentrics-ui` dependency
  (`implementation "com.usercentrics.sdk:usercentrics-ui:$usercentrics_version"`).
  This wrapper always tracks the native SDK version 1:1 — there is no
  independent native-SDK-version field.
- `ios/usercentrics_sdk.podspec` — `s.version`. Same deal: it's also used as
  the pin for the native `UsercentricsUI` pod
  (`s.dependency 'UsercentricsUI', "#{s.version}"`).
- `CHANGELOG.md` — new entry at the top, above the previous latest version.
  Follow the existing format: `### X.Y.Z – <Month> <day>, <year>`, then
  `## Features` / `## Fixes` / `## Chores` sections, each bullet tagged with
  the affected platform/area in bold, e.g. `**[iOS]**`, `**[Android]**`,
  `**[TCF]**`, `**[PUR]**`.

Do **not** bump `example/pubspec.yaml` — that's the sample app's own version
(`1.0.0+1` style), unrelated to the SDK version.

## 2. Before bumping: verify the native SDK version is actually published

Because `android/build.gradle` and the iOS podspec pin the *native*
Usercentrics SDK to the exact same version number as the wrapper, bumping the
wrapper to a version that hasn't shipped natively yet will break resolution.
Check first:

- Android (Maven Central):
  `curl -s https://repo1.maven.org/maven2/com/usercentrics/sdk/usercentrics-ui/maven-metadata.xml`
  and confirm the target version is listed under `<release>`/`<versions>`.
- iOS (CocoaPods trunk):
  `pod spec cat UsercentricsUI` (or `pod trunk info UsercentricsUI`) and
  confirm the target version is published.

If either isn't published yet, bumping is premature — wait for the native
release.

## 3. Bump, then regenerate lockfiles

```
flutter pub get                 # repo root
cd example && flutter pub get   # example app
cd example/ios && pod install   # or `pod update <PodName>` — see below
```

**iOS gotcha:** if `example/ios/Podfile.lock` already pins the old native pod
version, plain `pod install` will refuse to resolve
(`could not find compatible versions for pod "UsercentricsUI"`) and tell you
to run `pod update <PodName>` instead — do that
(e.g. `pod update UsercentricsUI`). This is expected, not an error to work
around another way.

**Known lockfile churn to expect / ignore:**
- Root `pubspec.lock` does **not** reference the wrapper's own version
  (`grep usercentrics pubspec.lock` returns nothing), so running `flutter pub
  get`/`flutter analyze`/`flutter test` at the root can rewrite unrelated dev
  dependency pins (e.g. `matcher`, `test`, `test_api`, `test_core`) purely
  because of local pub cache/registry drift — this happens even without
  touching any dependency constraint. It reproduces deterministically on
  rerun but is unrelated to the release. Revert it
  (`git checkout -- pubspec.lock`) before committing; don't include it.
- `example/pubspec.lock` legitimately changes one line (the wrapper's own
  pinned version, via `path:` dependency) — that one's expected and should be
  committed.
- `example/ios/Podfile.lock` will show the 3 SDK-related pods
  (`Usercentrics`, `UsercentricsUI`, `usercentrics_sdk`) bumping version and
  checksum — expected. If you see churn in *unrelated* pods' checksums,
  re-run `pod install` a second time and diff again: it should be stable
  (deterministic) on rerun. If it isn't stable, that's worth investigating
  before committing.

## 4. Run tests before committing

- `flutter analyze` — must be clean.
- `flutter test` — Dart unit tests.
- Android native unit tests: `cd example/android && ./gradlew
  :usercentrics_sdk:test`. Worth a `--rerun-tasks` clean run at least once
  after a native-SDK version bump — Gradle's up-to-date checks don't always
  reliably invalidate on a transitive dependency version change alone.
- iOS native tests: `cd example/ios && xcodebuild -workspace
  Runner.xcworkspace -scheme Runner -destination 'id=<simulator-udid>' test`.
  Note the test scheme is `Runner` (the app scheme), not `RunnerTests` —
  `RunnerTests` is a target, not a scheme, in this project. Find a simulator
  UDID with `xcrun simctl list devices available`; using a `name=` destination
  can be ambiguous when multiple OS versions of the same device model are
  installed, so prefer `id=`.

**Bumping the native SDK version can break the native bridge code at compile
time**, independent of anything in this repo's own history — the native SDK
is free to add parameters to existing public APIs between releases, and
Swift/Kotlin handle that differently:
- Kotlin call sites compile fine against a newly-added parameter as long as
  the native Kotlin API declares a default value — Kotlin's `$default`
  synthetic methods let old call sites keep compiling unchanged.
- The iOS framework is a Kotlin Multiplatform module exported via Kotlin's
  Objective-C interop, and **that interop does not carry Kotlin default
  parameter values through to the generated Swift/Obj-C API** — every
  parameter becomes required from Swift, even ones that are optional-with-a-
  default on the Kotlin/Android side. So a native release can compile fine on
  Android and fail to compile on iOS for the exact same API change.

  This happened for 2.29.1: `denyAll`/`denyAllForTCF` gained a new
  `unsavedServiceDecisions` parameter (feeds the UK-DUAA "statistical
  exception" exclusion from Reject All/Deny All). Fix pattern for a wrapper
  that doesn't expose that feature in its own public API yet: pass `nil` for
  it at the bridge call site — this is exactly what the Unity/Unreal
  integrations in the core `mobile-sdk` repo do too, and is behavior-
  preserving (falls back to each service's last-persisted consent state).
  Any test fakes/mocks that subclass the native SDK to override these methods
  (see `example/ios/RunnerTests/Fake/FakeUsercentricsSDK.swift`) need their
  overridden signatures updated to match, or the override silently stops
  overriding and the fake's stubbed method just isn't called.

  **Takeaway:** after any native-SDK version bump, always do a full iOS
  `xcodebuild test` run (not just `flutter test`) before assuming the bump is
  safe — a native API addition can be a silent breaking change for the iOS
  bridge specifically, invisible from the Dart/Android side.

## 5. What CI validates vs. what's fine to skip locally

Not verified locally for the 2.29.1 release — left for CI:
- iOS device/physical-hardware testing (only ran on Simulator locally).
- Any Android instrumented/emulator tests (only the JVM unit test suite
  `:usercentrics_sdk:test` was run locally; no emulator was used).
- `pub.dev` publish dry-run / actual publish, and CocoaPods trunk push for
  this wrapper package itself (not applicable — this package isn't
  independently published to CocoaPods; iOS distribution is via
  `pubspec.yaml`/pub.dev only, consuming the native pod as a transitive
  dependency).

## 6. Commit convention

Follow the existing history (`git log --oneline`): the PR/merge title is
`Release: X.Y.Z (#NNN)`, and the branch's own commit (before merge) is
`Release: X.Y.Z` or `Bump version to X.Y.Z`. Only these should be in the
release commit/PR:
- `CHANGELOG.md`
- the version-bump files listed in section 1
- the regenerated lockfiles (`pubspec.lock` files, `Podfile.lock`) — but see
  the churn note in section 3 about reverting *unrelated* lockfile diffs
- any code changes strictly required to keep the bump compiling/passing
  (e.g. the iOS bridge fix described in section 4) — keep these minimal and
  call them out explicitly in the PR description; they are not "unrelated
  code" if the bump doesn't build without them, but don't use the release PR
  to sneak in unrelated fixes or features.
