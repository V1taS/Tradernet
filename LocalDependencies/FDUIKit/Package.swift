// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "FDUIKit",
  defaultLocalization: "en",
  platforms: [.iOS(.v13)],
  products: [
    .library(
      name: "FDUIKit",
      targets: ["FDUIKit"]
    ),
  ],
  dependencies: [
    .package(path: "../../LocalDependencies/FDStyle"),
    .package(path: "../../LocalDependencies/FDAbstractions"),
    .package(path: "../../LocalDependencies/FDFoundation")
  ],
  targets: [
    .target(
      name: "FDUIKit",
      dependencies: [
        "FDStyle",
        "FDAbstractions",
        "FDFoundation"
      ]
    )
  ]
)
