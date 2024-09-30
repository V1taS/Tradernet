//
//  AppDelegate.swift
//  Tradernet
//
//  Created by Vitalii Sosin on 30.09.2024.
//  Copyright © 2024 SosinVitalii.com. All rights reserved.
//

import UIKit

@main
final class AppDelegate: UIResponder, UIApplicationDelegate {
  func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    return true
  }
  
  // MARK: UISceneSession Lifecycle
  
  func application(
    _ application: UIApplication,
    configurationForConnecting connectingSceneSession: UISceneSession,
    options: UIScene.ConnectionOptions
  ) -> UISceneConfiguration {
    let sceneConfig: UISceneConfiguration = UISceneConfiguration(
      name: nil,
      sessionRole: connectingSceneSession.role
    )
    sceneConfig.delegateClass = SceneDelegate.self
    return sceneConfig
  }
  
  func application(
    _ application: UIApplication,
    didDiscardSceneSessions sceneSessions: Set<UISceneSession>
  ) {}
}
