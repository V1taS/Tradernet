//
//  ConfigurableView.swift
//  FDUIKit
//
//  Created by Vitalii Sosin on 30.09.2024.
//

import Foundation

/// Протокол конфигурируемой view
public protocol ConfigurableView {
  
  /// Сконфигурировать
  /// - Parameter object: объект для конфигурирования
  func configure(with object: Any)
}
