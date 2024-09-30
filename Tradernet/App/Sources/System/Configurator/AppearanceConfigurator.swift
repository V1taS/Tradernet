//
//  AppearanceConfigurator.swift
//  Tradernet
//
//  Created by Vitalii Sosin on 30.09.2024.
//  Copyright © 2024 SosinVitalii.com. All rights reserved.
//

import UIKit
import FDUIKit
import FDStyle
import FDAbstractions

struct AppearanceConfigurator: Configurator {
  
  // MARK: - Private properties
  
  private let textAttributes: [NSAttributedString.Key: Any] = [.font: UIFont.fancy.text.regularMedium]
  
  // MARK: - Internal func
  
  func configure() {
    setupApplicationTheme()
    setupTabBarAppearance()
    setupNavigationBarAppearance()
    setupBarButtonItemAppearance()
  }
}

// MARK: - Private

private extension AppearanceConfigurator {
  func setupApplicationTheme() {
    UIApplication.currentWindow?.overrideUserInterfaceStyle = .light
  }
  
  func setupTabBarAppearance() {
    UITabBar.appearance().tintColor = FDStyleAsset.constantAzure.color
    UITabBar.appearance().unselectedItemTintColor = FDStyleAsset.constantSlate.color
    UITabBar.appearance().backgroundColor = FDStyleAsset.onyx.color.withAlphaComponent(0.99)
    UITabBar.appearance().backgroundImage = UIImage()
    UITabBar.appearance().shadowImage = UIImage()
    UITabBar.appearance().clipsToBounds = true
    UITabBarItem.appearance().setTitleTextAttributes(
      [
        .font: UIFont.fancy.text.small
      ],
      for: .normal
    )
  }
  
  func setupNavigationBarAppearance() {
    let appearance = UINavigationBarAppearance()
    appearance.configureWithDefaultBackground()
    appearance.backgroundColor = FDStyleAsset.onyx.color.withAlphaComponent(0.99)
    appearance.shadowColor = .clear
    appearance.shadowImage = UIImage()
    UINavigationBar.appearance().standardAppearance = appearance
    UINavigationBar.appearance().compactAppearance = appearance
    UINavigationBar.appearance().scrollEdgeAppearance = appearance
    if #available(iOS 15.0, *) {
      UINavigationBar.appearance().compactScrollEdgeAppearance = appearance
    }
    UINavigationBar.appearance().isTranslucent = true
    UINavigationBar.appearance().titleTextAttributes = textAttributes
    UINavigationBar.appearance().tintColor = FDStyleAsset.constantAzure.color
    UINavigationBar.appearance().barTintColor = FDStyleAsset.onyx.color.withAlphaComponent(0.99)
  }
  
  func setupBarButtonItemAppearance() {
    UIBarButtonItem.appearance(
      whenContainedInInstancesOf: [UINavigationBar.self]
    ).setTitleTextAttributes(textAttributes, for: [])
    UIBarButtonItem.appearance(
      whenContainedInInstancesOf: [UINavigationBar.self]
    ).setTitleTextAttributes(
      textAttributes,
      for: .normal
    )
    UIBarButtonItem.appearance(
      whenContainedInInstancesOf: [UINavigationBar.self]
    ).setTitleTextAttributes(textAttributes, for: .highlighted)
    UIBarButtonItem.appearance(
      whenContainedInInstancesOf: [UINavigationBar.self]
    ).setTitleTextAttributes(
      textAttributes,
      for: .selected
    )
    UIBarButtonItem.appearance(
      whenContainedInInstancesOf: [UINavigationBar.self]
    ).setTitleTextAttributes(textAttributes, for: .focused)
    UIBarButtonItem.appearance(
      whenContainedInInstancesOf: [UINavigationBar.self]
    ).setTitleTextAttributes(textAttributes, for: .disabled)
  }
}
