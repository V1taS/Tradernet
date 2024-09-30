//
//  MainScreenAbstractions.swift
//  Tradernet
//
//  Created by Vitalii Sosin on 30.09.2024.
//

import UIKit

/// События которые отправляем из `MainScreenModule` в `Coordinator`
public protocol MainScreenModuleOutput: AnyObject {}

/// События которые отправляем из `Coordinator` в `MainScreenModule`
public protocol MainScreenModuleInput {

  /// События которые отправляем из `MainScreenModule` в `Coordinator`
  var moduleOutput: MainScreenModuleOutput? { get set }
}

/// Готовый модуль `MainScreenModule`
public typealias MainScreenModule = UIViewController & MainScreenModuleInput

/// Сборщик модуля `MainScreenModule`
public typealias MainScreenModuleAssembly = () -> MainScreenModule
