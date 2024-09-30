// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "FDServices",
  defaultLocalization: "en",
  platforms: [.iOS(.v12)],
  products: [
    .library(
      name: "FDServices",
      targets: ["FDServices"]
    ),
  ],
  dependencies: [
    .package(path: "../../LocalDependencies/FDStyle"),
    .package(path: "../../LocalDependencies/FDAbstractions"),
    .package(path: "../../LocalDependencies/FDNotifications"),
    .package(url: "https://github.com/daltoniam/Starscream.git", exact: "4.0.8"),
  ],
  targets: [
    .target(
      name: "FDServices",
      dependencies: [
        "FDStyle",
        "FDAbstractions",
        "FDNotifications",
        "Starscream"
      ]
    ),
    .testTarget(
      name: "FDServicesTests",
      dependencies: ["FDServices"]
    ),
  ]
)
