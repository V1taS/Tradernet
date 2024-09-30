// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "FDServices",
  defaultLocalization: "en",
  platforms: [.iOS(.v13)],
  products: [
    .library(
      name: "FDServices",
      targets: ["FDServices"]
    ),
  ],
  dependencies: [
    .package(path: "../../LocalDependencies/FDStyle"),
    .package(path: "../../LocalDependencies/FDAbstractions"),
    .package(path: "../../LocalDependencies/FDFoundation"),
    .package(path: "../../LocalDependencies/FDNotifications"),
    .package(path: "../../LocalDependencies/FDNetwork")
  ],
  targets: [
    .target(
      name: "FDServices",
      dependencies: [
        "FDStyle",
        "FDAbstractions",
        "FDFoundation",
        "FDNotifications",
        "FDNetwork"
      ]
    ),
    .testTarget(
      name: "FDServicesTests",
      dependencies: ["FDServices"]
    ),
  ]
)
