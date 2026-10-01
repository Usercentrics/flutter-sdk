// swift-tools-version:5.6
import PackageDescription

// WORKAROUND (MSDK-4831): vendored local copy of usercentrics-spm-sdk's real published
// Package.swift at tag 2.32.0, with the Sentry Cocoa version pin fixed. The real remote tag
// has "SENTRY_COCOA_2.32.0_PLACEHOLDER" (an unsubstituted release-template placeholder, not a
// valid semver) in its Package.swift, which breaks `swift package resolve` for every SPM
// consumer. Root cause: a Gradle `copy { filter { it.replace("VERSION", sdkVersion) } }` step
// in mobile-sdk's build.gradle.kts corrupts the SENTRY_COCOA_VERSION_PLACEHOLDER string before
// the release script's own placeholder substitution ever runs. Fix tracked in mobile-sdk
// Jira MSDK-4831 / PR #2539, to ship in a 2.32.1 patch. Remove this vendor directory and point
// back at the remote tag once 2.32.1 (or later) is published with a corrected manifest.
//
// Everything below is identical to the real tag except the one Sentry version string
// ("8.52.0", the real sentry_cocoa_xcframework_version pinned in mobile-sdk's gradle.properties
// at the time 2.32.0 was cut) and this comment block.

let package = Package(
    name: "Usercentrics",
    platforms: [
        .iOS(.v11),
        .tvOS(.v11)
    ],
    products: [
        .library(
            name: "Usercentrics",
            targets: ["Usercentrics", "UsercentricsSentrySupport"]
        ),
    ],
    dependencies: [
        // Usercentrics.xcframework links `-framework Sentry` eagerly (see :usercentrics build.gradle.kts),
        // mirroring the CocoaPods podspec's `s.dependency 'Sentry'`. A .binaryTarget can't declare its own
        // dependencies, so without this, SPM consumers crash at launch with
        // "Library not loaded: @rpath/Sentry.framework/Sentry" — regardless of crashReportingEnabled.
        .package(url: "https://github.com/getsentry/sentry-cocoa", from: "8.52.0"),
    ],
    targets: [
        .binaryTarget(
            name: "Usercentrics",
            url: "https://bitbucket.org/usercentricscode/usercentrics-spm-sdk/downloads/Usercentrics-2.32.0.xcframework.zip",
            checksum: "1935bee08f8bc83e700f693e0cc3a247286823f6201f9851c462d34199cfb617"
        ),
        // Empty glue target: exists only so depending on the "Usercentrics" product transitively resolves
        // and links Sentry Cocoa, matching what the binary target above already expects at runtime.
        .target(
            name: "UsercentricsSentrySupport",
            dependencies: [
                // Must be "Sentry-Dynamic", not the default "Sentry" product — the default is a static
                // archive; Usercentrics.xcframework's `-framework Sentry` load command expects a genuine
                // dynamic Sentry.framework, matching the dynamic XCFramework used for the CocoaPods build.
                // Verified by inspecting both products' actual binaries: default "Sentry" is `ar archive`
                // (static) on every slice, "Sentry-Dynamic" is a real Mach-O dynamically linked library.
                .product(name: "Sentry-Dynamic", package: "sentry-cocoa"),
            ]
        ),
    ]
)
