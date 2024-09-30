//
//  MainScreenCoordinator.swift
//  Tradernet
//
//  Created by Vitalii Sosin on 30.09.2024.
//

import FDAbstractions
import UIKit

/// Координатор экрана `MainScreen`
typealias MainScreenCoordinatorProtocol = Coordinator<Void, Void>

/// Сборщик экрана `MainScreen`
typealias MainScreenCoordinatorAssemblyClosure = () -> MainScreenCoordinatorProtocol

// MARK: - MainScreenCoordinator

/// Координатор `MainScreen`
final class MainScreenCoordinator: MainScreenCoordinatorProtocol {
  
  // MARK: - Private property
  
  private var module: MainScreenModule?
  private let moduleAssembly: MainScreenModuleAssembly
  private var navigationController: UINavigationController?
  
  // MARK: - Initialisation
  
  /// Ининциализатор
  /// - Parameters:
  ///   - moduleAssembly: Сборщик экрана
  init(moduleAssembly: @escaping MainScreenModuleAssembly) {
    self.moduleAssembly = moduleAssembly
  }
  
  // MARK: - Life cycle
  
  override func start(parameter: Void) {
    openMainScreenModule()
  }
}

// MARK: - MainScreenModuleOutput

extension MainScreenCoordinator: MainScreenModuleOutput {}

// MARK: - Open modules

private extension MainScreenCoordinator {
  func openMainScreenModule() {
    let module = moduleAssembly()
    self.module = module
    self.module?.moduleOutput = self
    self.navigationController = module.wrapToNavigationController()
    navigationController?.presentAsRoot()
  }
}
