// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "usercentrics_sdk",
    platforms: [.iOS("11.0")],
    products: [
        .library(name: "usercentrics-sdk", targets: ["usercentrics_sdk"])
    ],
    dependencies: [
        .package(url: "https://bitbucket.org/usercentricscode/usercentrics-spm-ui", exact: "2.30.0"),
        .package(url: "https://bitbucket.org/usercentricscode/usercentrics-spm-sdk", exact: "2.30.0")
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
