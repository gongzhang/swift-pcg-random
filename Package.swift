// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "PcgRandom",
    platforms: [.iOS(.v11), .macOS(.v10_13), .watchOS(.v4)],
    products: [
        .library(
            name: "PcgRandom",
            targets: ["PcgRandom"]),
    ],
    dependencies: [
        .package(url: "https://github.com/gongzhang/UInt128.git", .upToNextMajor(from: "1.0.1")),
    ],
    targets: [
        .target(
            name: "PcgRandom",
            dependencies: [
                .byNameItem(name: "PcgRandomC", condition: .when(platforms: [.macOS, .iOS])),
                .byNameItem(name: "UInt128", condition: .when(platforms: [.watchOS])),
            ]),
        .target(
            name: "PcgRandomC",
            dependencies: []),
        .testTarget(
            name: "PcgRandomTests",
            dependencies: ["PcgRandom"]),
    ],
    swiftLanguageVersions: [.v5]
)
