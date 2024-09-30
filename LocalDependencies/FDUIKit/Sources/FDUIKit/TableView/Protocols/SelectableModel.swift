//
//  SelectableModel.swift
//  FDUIKit
//
//  Created by Vitalii Sosin on 30.09.2024.
//

import UIKit

/// Модель поддерживающая выделение
public protocol SelectableModel {
  
  /// IndexPath другой модели которая должны быть выделена
  var alterSelectedIndexPath: IndexPath? { get }
  
  /// IndexPath другой модели у которой должно быть снято выделение
  var alterDeselectedIndexPath: IndexPath? { get }
  
  /// Ячейка будет выделена
  func willSelect() -> Bool
  
  /// Ячейка была выделена
  func didSelect()
  
  /// У ячейки будет снято выделение
  func willDeselect() -> Bool
  
  /// У ячейки было снято выделение
  func didDeselect()
}

extension SelectableModel {
  public var alterSelectedIndexPath: IndexPath? { nil }
  public var alterDeselectedIndexPath: IndexPath? { nil }
  public func willSelect() -> Bool { true }
  public func didSelect() {}
  public func willDeselect() -> Bool { true }
  public func didDeselect() {}
}
