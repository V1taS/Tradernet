//
//  SceneDelegate.swift
//  Tradernet
//
//  Created by Vitalii Sosin on 30.09.2024.
//  Copyright © 2024 SosinVitalii.com. All rights reserved.
//

import UIKit
import FDAbstractions
import SwiftUI

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {
  
  // MARK: - Internal properties
  
  var window: UIWindow?
  
  // MARK: - Private properties
  
  private var mainScreenCoordinator: MainScreenCoordinatorProtocol?
  
  // MARK: - Internal func
  
  func application(
    _ application: UIApplication,
    configurationForConnecting connectingSceneSession: UISceneSession,
    options: UIScene.ConnectionOptions
  ) -> UISceneConfiguration {
    let sceneConfig = UISceneConfiguration(name: nil, sessionRole: connectingSceneSession.role)
    sceneConfig.delegateClass = SceneDelegate.self
    return sceneConfig
  }
  
  func scene(
    _ scene: UIScene,
    willConnectTo session: UISceneSession,
    options connectionOptions: UIScene.ConnectionOptions
  ) {
    guard let windowScene = scene as? UIWindowScene else { return }
    let mainScreenCoordinatorAssembly: MainScreenCoordinatorAssemblyClosure = {
      MainScreenCoordinatorAssembly().createCoordinator()
    }
    self.mainScreenCoordinator = mainScreenCoordinatorAssembly()
    
    configurators().configure()
    window = UIWindow(windowScene: windowScene)
    window?.makeKeyAndVisible()
    
    mainScreenCoordinator?.start()
  }
}

// MARK: - Private

private extension SceneDelegate {
  func configurators() -> [Configurator] {
    return [
      AppearanceConfigurator()
    ]
  }
}
