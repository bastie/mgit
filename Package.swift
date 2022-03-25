// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "libmgit",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "libmgit",
            targets: ["libmgit"]),
        .executable(name: "mgit", targets: ["mgit"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
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

        .testTarget(
            name: "libmgitTests",
            dependencies: ["libmgit"]),
    ]
)
