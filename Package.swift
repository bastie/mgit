// swift-tools-version: 5.6

import PackageDescription

let package = Package(
    name: "libmgit",
    products: [
        .library(
            name: "libmgit",
            targets: ["libmgit"]),
        .executable(name: "mgit", targets: ["mgit"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser.git", .upToNextMajor(from: "1.0.0")),
        .package(url: "https://github.com/bastie/egg.git", .upToNextMajor(from: "0.1.0")),
    ],
    targets: [
        // MARK: Targets
        /// libmgit is the primary library
        .target(
            name: "libmgit",
            dependencies: []),
        /// mgit is the primary executable
        .executableTarget(
            name: "mgit",
            dependencies: [
                "libmgit",
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
                .product(name: "KnightLife", package: "egg"),
            ]),
    ]
)
