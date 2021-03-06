// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MySwiftPakage",
    platforms: [
           .iOS(.v10),
           .macOS(.v10_12),
           .tvOS(.v10)
       ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "MySwiftPakage",
            targets: ["MySwiftPakage"]),
    ],
    dependencies: [
           .package(url: "https://github.com/Alamofire/Alamofire.git", .upToNextMajor(from: "5.0.0")),
       ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "MySwiftPakage",
            dependencies: []),
        .testTarget(
            name: "MySwiftPakageTests",
            dependencies: ["MySwiftPakage"]),
    ],
    swiftLanguageVersions: [
            .v5
        ]
)
