//
//  MainScreenAssembly.swift
//  Tradernet
//
//  Created by Vitalii Sosin on 30.09.2024.
//

import Foundation
import FDAbstractions

/// Сборщик `MainScreen`
public final class MainScreenAssembly {
  
  public init() {}
  
  /// Собирает модуль `MainScreen`
  /// - Returns: Cобранный модуль `MainScreen`
  public func createModule(services: IApplicationServices) -> MainScreenModule {
    let interactor = MainScreenInteractor(services: services)
    let factory = MainScreenFactory()
    let presenter = MainScreenViewController(
      interactor: interactor,
      factory: factory
    )
    
    interactor.output = presenter
    factory.output = presenter
    return presenter
  }
}
