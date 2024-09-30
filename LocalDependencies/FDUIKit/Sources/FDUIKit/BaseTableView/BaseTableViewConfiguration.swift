//
//  BaseTableViewConfiguration.swift
//  FDUIKit
//
//  Created by Vitalii Sosin on 30.09.2024.
//

import UIKit

/// Конфигурация базовой view с таблицей
public struct BaseTableViewConfiguration {
  
  /// Стиль таблицы
  let style: UITableView.Style
  
  /// Отступы секций
  let directionalLayoutMargins: NSDirectionalEdgeInsets?
  
  /// Инициализация
  /// - Parameters:
  ///   - style: Стиль таблицы
  ///   - directionalLayoutMargins: Отступы секций
  public init(style: UITableView.Style, directionalLayoutMargins: NSDirectionalEdgeInsets? = nil) {
    self.style = style
    self.directionalLayoutMargins = directionalLayoutMargins
  }
}

public extension BaseTableViewConfiguration {
  static let `default` = BaseTableViewConfiguration(style: .plain)
  
  static let grouped = BaseTableViewConfiguration(
    style: .insetGrouped,
    directionalLayoutMargins: .init(
      top: .zero,
      leading: .leastNonzeroMagnitude,
      bottom: .zero,
      trailing: .leastNonzeroMagnitude
    )
  )
}
