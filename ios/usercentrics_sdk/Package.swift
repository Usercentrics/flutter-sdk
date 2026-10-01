// swift-tools-version: 5.9
import PackageDescription

// WORKAROUND (MSDK-4831): usercentrics-spm-sdk's published 2.32.0 tag has a corrupted
// Package.swift (invalid Sentry Cocoa version placeholder), which breaks `swift package
// resolve` for every SPM consumer, including this plugin. Pointing at vendored local copies
// (Vendor/usercentrics-spm-sdk, Vendor/usercentrics-spm-ui) with the placeholder fixed instead
// of the remote tags, until a corrected native SDK version is published. Fix tracked in
// mobile-sdk Jira MSDK-4831 / PR #2539, targeting a 2.32.1 patch — revert to the remote URLs
// below once that ships.
//   .package(url: "https://bitbucket.org/usercentricscode/usercentrics-spm-ui", exact: "2.32.0"),
//   .package(url: "https://bitbucket.org/usercentricscode/usercentrics-spm-sdk", exact: "2.32.0")

let package = Package(
    name: "usercentrics_sdk",
    platforms: [.iOS("11.0")],
    products: [
        .library(name: "usercentrics-sdk", targets: ["usercentrics_sdk"])
    ],
    dependencies: [
        .package(path: "Vendor/usercentrics-spm-ui"),
        .package(path: "Vendor/usercentrics-spm-sdk")
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
)
