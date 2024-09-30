//
//  MainScreenCoordinatorAssembly.swift
//  Tradernet
//
//  Created by Vitalii Sosin on 30.09.2024.
//

import FDFoundation
import FDAbstractions

// MARK: - MainScreenCoordinatorAssembly

/// Сборщик координатора экранов `MainScreen`
final class MainScreenCoordinatorAssembly {
  
  /// Создание координатора экрана `MainScreen`
  /// - Parameters:
  ///   - container: Контейнер для получения зависимостей из Swinject
  ///   - navigationController: Навигейшн контроллер
  /// - Returns: Координатор для создания нового платежа
  func createCoordinator() -> MainScreenCoordinatorProtocol {
    return MainScreenCoordinator(
      moduleAssembly: {
        MainScreenAssembly().createModule()
      }
    )
  }
}
