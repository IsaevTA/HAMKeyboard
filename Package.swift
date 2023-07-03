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
        .package(url: "https://github.com/SnapKit/SnapKit.git", .upToNextMajor(from: "5.6.0"))
    ],
    targets: [
        .target(
            name: "HAMKeyboard",
            dependencies: ["SnapKit"]),
    ]
)
