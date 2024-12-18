//
//  MainScreenCoordinatorAssembly.swift
//  Tradernet
//
//  Created by Vitalii Sosin on 30.09.2024.
//

import FDAbstractions

// MARK: - MainScreenCoordinatorAssembly

/// Сборщик координатора экранов `MainScreen`
final class MainScreenCoordinatorAssembly {
  
  /// Создание координатора экрана `MainScreen`
  /// - Parameters:
  ///   - container: Контейнер для получения зависимостей из Swinject
  ///   - navigationController: Навигейшн контроллер
  /// - Returns: Координатор для создания нового платежа
  func createCoordinator(services: IApplicationServices) -> MainScreenCoordinatorProtocol {
    return MainScreenCoordinator(
      moduleAssembly: {
        MainScreenAssembly().createModule(services: services)
      }
    )
  }
}
