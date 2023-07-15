// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "HAMKeyboard",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "HAMKeyboard",
            targets: ["HAMKeyboard"]),
    ],
    dependencies: [

    ],
    targets: [
        .target(
            name: "HAMKeyboard",
            dependencies: []),
    ]
)
