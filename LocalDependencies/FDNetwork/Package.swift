// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "FDNetwork",
  defaultLocalization: "en",
  platforms: [.iOS(.v12)],
  products: [
    .library(
      name: "FDNetwork",
      targets: ["FDNetwork"]
    ),
  ],
  dependencies: [],
  targets: [
    .target(
      name: "FDNetwork",
      dependencies: []
    )
  ]
)
