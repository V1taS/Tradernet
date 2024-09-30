//
//  ActionableModel.swift
//  FDUIKit
//
//  Created by Vitalii Sosin on 30.09.2024.
//

import Foundation

/// Модель c действием
public protocol ActionableModel {
  
  /// Общее действие, выполняющееся при выборе(select) ячейки
  var action: (() -> Void) { get }
}
