// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "FDNotifications",
  defaultLocalization: "en",
  platforms: [.iOS(.v12)],
  products: [
    .library(
      name: "FDNotifications",
      targets: ["FDNotifications"]
    ),
  ],
  dependencies: [],
  targets: [
    .target(
      name: "FDNotifications",
      dependencies: []
    )
  ]
)
