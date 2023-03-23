// swift-tools-version: 5.7

///
import PackageDescription

///
let package = Package(
    name: "ReferenceType-module",
    products: [
        .library(
            name: "ReferenceType-module",
            targets: ["ReferenceType-module"]
        ),
        .library(
            name: "ReferenceTypeTestToolkit",
            targets: ["ReferenceTypeTestToolkit"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/jeremyabannister/ProperValueType-module",
            from: "0.1.0"
        ),
    ],
    targets: [
        .target(
            name: "ReferenceType-module",
            dependencies: [
                "ProperValueType-module",
            ]
        ),
        .target(
            name: "ReferenceTypeTestToolkit",
            dependencies: [
                "ReferenceType-module",
                .product(
                    name: "ProperValueTypeTestToolkit",
                    package: "ProperValueType-module"
                )
            ]
        ),
        .testTarget(
            name: "ReferenceType-tests",
            dependencies: [
                "ReferenceTypeTestToolkit",
            ]
        ),
        .testTarget(
            name: "ReferenceTypeTestToolkit-tests",
            dependencies: [
                "ReferenceTypeTestToolkit",
            ]
        ),
    ]
)
