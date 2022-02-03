// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "RickMorty",
    
    platforms: [
        .iOS(.v13)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "RickMorty",
            targets: ["RickMorty"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/ReactiveX/RxSwift.git", from: "5.0.0"),

    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "RickMorty",
            dependencies: ["RxSwift",
                           .product(name: "RxCocoa", package: "RxSwift")],
            resources: [
                .process("Resource/Json")
            ]),
        .testTarget(
            name: "RickMortyTests",
            dependencies: ["RickMorty"],
            resources: [
                .copy("ResourceMock")
            ]
        )
    ]
)
