// swift-tools-version: 5.8

import PackageDescription

let package = Package(
    name: "GildedRose",
    products: [
        .library(
            name: "GildedRose",
            targets: ["GildedRose"]),
    ],
    targets: [
        .target(
            name: "GildedRose",
            dependencies: []),
        .testTarget(
            name: "GildedRoseTests",
            dependencies: ["GildedRose"]),
    ]
)
