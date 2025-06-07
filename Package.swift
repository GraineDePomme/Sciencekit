// swift-tools-version: 6.1

import PackageDescription

let package = Package(
    name: "ScienceKit",

    products: [
        .library(name: "ScienceKit", targets: ["ScienceKit"])
    ],

    dependencies: [
        .package(url: "https://github.com/apple/swift-numerics", from: "1.0.0")
    ],

    targets: [
        .target(name: "ScienceKit", 
                dependencies: [.product(name: "Numerics", package: "swift-numerics")]
        ),

        .testTarget(name: "ScienceKitTests", 
                    dependencies: ["ScienceKit"]
        )
    ]
)
