//
//  MainScreenFactory.swift
//  Tradernet
//
//  Created by Vitalii Sosin on 30.09.2024.
//

import Foundation

/// Cобытия которые отправляем из Factory в Presenter
protocol MainScreenFactoryOutput: AnyObject {}

/// Cобытия которые отправляем от Presenter к Factory
protocol MainScreenFactoryInput {}

/// Фабрика
final class MainScreenFactory: MainScreenFactoryInput {
  
  // MARK: - Internal properties
  
  weak var output: MainScreenFactoryOutput?
  
  // MARK: - Internal func
}

// MARK: - Appearance

private extension MainScreenFactory {
  struct Appearance {}
}
