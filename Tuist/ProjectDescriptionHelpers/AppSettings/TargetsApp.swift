//
//  TargetsApp.swift
//  ProjectDescriptionHelpers
//
//  Created by Vitalii Sosin on 04.03.2024.
//

import ProjectDescription

public extension Array<Target> {
  static var app: Self {
    [
      Target(
        name: Constants.appNameRelease,
        destinations: .iOS,
        product: .app,
        bundleId: "\(Constants.bundleApp)",
        deploymentTargets: .defaultDeploymentTargets,
        infoPlist: InfoPlist.app,
        sources: [
          "\(Constants.rootPath)/\(Constants.appPath)/Sources/**/*",
        ],
        resources: [
          "\(Constants.rootPath)/\(Constants.appPath)/Resources/**/*"
        ],
        scripts: [
          .swiftlint(configPath: "\(Constants.appNameRelease)/\(Constants.appPath)/Sources"),
        ],
        dependencies: [
          .external(name: "FDUIKit"),
          .external(name: "FDServices")
        ],
        settings: Settings.app
      ),
      Target(
        name: "\(Constants.appNameRelease)Tests",
        destinations: .iOS,
        product: .unitTests,
        bundleId: "\(Constants.bundleApp)",
        deploymentTargets: .defaultDeploymentTargets,
        sources: ["\(Constants.rootPath)/\(Constants.appPath)/Tests/**"],
        dependencies: [
          .target(name: "\(Constants.appNameRelease)")
        ]
      )
    ]
  }
}
