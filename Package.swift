// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "BYCustomTextField",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "BYCustomTextField",
            targets: ["BYCustomTextField"]),
        .library(
            name: "BYCustomTextFieldSwiftUI",
            targets: ["BYCustomTextFieldSwiftUI"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "BYCustomTextField",
            dependencies: []
        ),
        .target(
            name: "BYCustomTextFieldSwiftUI",
            dependencies: []
        ),
    ]
)
