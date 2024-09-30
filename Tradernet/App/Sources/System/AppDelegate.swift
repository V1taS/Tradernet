//
//  AppDelegate.swift
//  Tradernet
//
//  Created by Vitalii Sosin on 30.09.2024.
//  Copyright © 2024 SosinVitalii.com. All rights reserved.
//

import UIKit
import FDAbstractions
import SwiftUI

@main
final class AppDelegate: UIResponder, UIApplicationDelegate, UIWindowSceneDelegate {
  
  // MARK: - Internal properties
  
  var window: UIWindow?
  
  // MARK: - Private properties
  
  private var mainScreenCoordinator: MainScreenCoordinatorProtocol?
  
  // MARK: - Internal func
  
  func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    
    // Проверяем версию iOS
    if #unavailable(iOS 13.0) {
      // Для iOS 12 и ниже создаем окно вручную
      setupWindowForPreiOS13()
    }
    return true
  }
  
  // MARK: UISceneSession Lifecycle (только для iOS 13 и выше)
  
  @available(iOS 13.0, *)
  func application(
    _ application: UIApplication,
    configurationForConnecting connectingSceneSession: UISceneSession,
    options: UIScene.ConnectionOptions
  ) -> UISceneConfiguration {
    let sceneConfig = UISceneConfiguration(name: nil, sessionRole: connectingSceneSession.role)
    sceneConfig.delegateClass = Self.self // Используем AppDelegate как делегат сцены
    return sceneConfig
  }
  
  @available(iOS 13.0, *)
  func scene(
    _ scene: UIScene,
    willConnectTo session: UISceneSession,
    options connectionOptions: UIScene.ConnectionOptions
  ) {
    guard let windowScene = scene as? UIWindowScene else { return }
    setupWindow(for: windowScene)
  }
  
  // MARK: - Private Methods
  
  private func setupWindowForPreiOS13() {
    window = UIWindow(frame: UIScreen.main.bounds)
    setupMainCoordinator()
    window?.makeKeyAndVisible()
  }
  
  @available(iOS 13.0, *)
  private func setupWindow(for windowScene: UIWindowScene) {
    window = UIWindow(windowScene: windowScene)
    setupMainCoordinator()
    window?.makeKeyAndVisible()
  }
  
  private func setupMainCoordinator() {
    let mainScreenCoordinatorAssembly: MainScreenCoordinatorAssemblyClosure = {
      MainScreenCoordinatorAssembly().createCoordinator()
    }
    self.mainScreenCoordinator = mainScreenCoordinatorAssembly()
    configurators().configure()
    window?.makeKeyAndVisible()
    mainScreenCoordinator?.start()
  }
}

// MARK: - Private

private extension AppDelegate {
  func configurators() -> [Configurator] {
    return [
      AppearanceConfigurator()
    ]
  }
}
