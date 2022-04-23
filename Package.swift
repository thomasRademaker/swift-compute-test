// swift-tools-version: 5.6

import PackageDescription

let package = Package(
    name: "rademaker",
    platforms: [
        .macOS(.v10_15)
    ],
    dependencies: [
         .package(url: "https://github.com/AndrewBarba/swift-compute-runtime", branch: "main"),
    ],
    targets: [
        .executableTarget(
            name: "Hello",
            dependencies: [.product(name: "Compute", package: "swift-compute-runtime")]
        ),
        .executableTarget(
            name: "Proxy",
            dependencies: [.product(name: "Compute", package: "swift-compute-runtime")]
        ),
        .executableTarget(
            name: "Rest",
            dependencies: [.product(name: "Compute", package: "swift-compute-runtime")]
        )
    ]
)
