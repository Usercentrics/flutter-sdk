// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "usercentrics_sdk",
    platforms: [
        .iOS("12.0"),
    ],
    products: [
        .library(name: "usercentrics-sdk", targets: ["usercentrics_sdk"])
    ],
    dependencies: [
        .package(url: "https://bitbucket.org/usercentricscode/usercentrics-spm-sdk", from: "2.18.9"),
        .package(url: "https://bitbucket.org/usercentricscode/usercentrics-spm-ui", from: "2.18.9"),
    ],
    targets: [
        .target(
            name: "usercentrics_sdk",
            dependencies: [
              .product(name: "Usercentrics", package: "usercentrics-spm-sdk"),
              .product(name: "UsercentricsUI", package: "usercentrics-spm-ui"),
            ],
            resources: [
                // TODO: If your plugin requires a privacy manifest
                // (e.g. if it uses any required reason APIs), update the PrivacyInfo.xcprivacy file
                // to describe your plugin's privacy impact, and then uncomment this line.
                // For more information, see:
                // https://developer.apple.com/documentation/bundleresources/privacy_manifest_files
                // .process("PrivacyInfo.xcprivacy"),

                // TODO: If you have other resources that need to be bundled with your plugin, refer to
                // the following instructions to add them:
                // https://developer.apple.com/documentation/xcode/bundling-resources-with-a-swift-package
            ]
        )
    ]
)
