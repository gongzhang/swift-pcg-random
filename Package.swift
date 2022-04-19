// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "PcgRandom",
    platforms: [.iOS(.v11), .macOS(.v10_10), .watchOS(.v2)],
    products: [
        .library(
            name: "PcgRandom",
            targets: ["PcgRandom"]),
    ],
    dependencies: [
        .package(url: "https://github.com/gongzhang/UInt128.git", .revision("9618a4c6cb022275d5a72a762c05ff5a1f6cda1f")),
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
