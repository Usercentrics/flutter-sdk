// swift-tools-version:5.6
import PackageDescription

// WORKAROUND (MSDK-4831): vendored local copy of usercentrics-spm-ui's real published
// Package.swift at tag 2.32.0. Content is identical to the real tag except the dependency on
// usercentrics-spm-sdk is redirected to the local vendored copy (../usercentrics-spm-sdk)
// instead of the remote tag, since that remote tag's manifest is corrupted (see the sibling
// Vendor/usercentrics-spm-sdk/Package.swift for details). Remove this vendor directory and
// point back at the remote tag once a corrected native SDK version is published (tracked in
// mobile-sdk Jira MSDK-4831 / PR #2539, targeting a 2.32.1 patch).

let package = Package(
    name: "UsercentricsUI",
    platforms: [
        .iOS(.v11),
        .tvOS(.v11)
    ],
    products: [
        .library(
            name: "UsercentricsUI",
            targets: ["UsercentricsUI"]
        )
    ],
    dependencies: [
        .package(path: "../usercentrics-spm-sdk")
    ],
    targets: [
        .binaryTarget(
            name: "UsercentricsUIFramework",
            url: "https://bitbucket.org/usercentricscode/usercentrics-spm-ui/downloads/UsercentricsUI-2.32.0.xcframework.zip",
            checksum: "673c8fdbb6314e8e29e0013f12b4f2a143513f38bdcb9ac0ca7d819c27cc6ed2"
        ),
        .target(
            name: "UsercentricsUI",
            dependencies: [
                .product(name: "Usercentrics", package: "usercentrics-spm-sdk"),
                "UsercentricsUIFramework"
            ]
        ),
    ]
)
