// swift-tools-version:5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "RickMorty",
    
    platforms: [
        .iOS(.v13)
    ],
    products: [

        .library(
            name: "RickMorty",
            targets: ["RickMorty"]),
    ],
    dependencies: [
        .package(url: "https://github.com/ReactiveX/RxSwift.git", from: "5.0.0"),
        .package(url: "https://github.com/realm/SwiftLint", from: "0.50.3")

    ],
    targets: [

        .target(
            name: "RickMorty",
            dependencies: ["RxSwift",
                           .product(name: "RxCocoa", package: "RxSwift")],
            resources: [
                .process("Resource/Json")
                
            ],
            plugins: [.plugin(name: "SwiftLintPlugin", package: "SwiftLint")]
        ),
        .testTarget(
            name: "RickMortyTests",
            dependencies: ["RickMorty"],
            resources: [
                .copy("ResourceMock")
            ]
        )
    ]
)
