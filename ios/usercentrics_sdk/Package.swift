// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "usercentrics_sdk",
    platforms: [.iOS("11.0")],
    products: [
        .library(name: "usercentrics-sdk", targets: ["usercentrics_sdk"])
    ],
    dependencies: [
        // TODO before merging: confirm this is the actual version mobile-sdk published its
        // MSDK-4831/MSDK-4862 fixes under (expected 2.32.1 per mobile-sdk Jira/PR, but verify
        // against the real usercentrics-spm-ui/usercentrics-spm-sdk tags before relying on it).
        .package(url: "https://bitbucket.org/usercentricscode/usercentrics-spm-ui", exact: "2.32.1"),
        .package(url: "https://bitbucket.org/usercentricscode/usercentrics-spm-sdk", exact: "2.32.1")
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
