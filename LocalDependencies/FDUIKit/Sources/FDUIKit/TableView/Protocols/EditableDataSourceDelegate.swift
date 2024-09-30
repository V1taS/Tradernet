//
//  EditableDataSourceDelegate.swift
//  FDUIKit
//
//  Created by Vitalii Sosin on 30.09.2024.
//

import Foundation

/// Протокол для возможности удаления ячейки
public protocol EditableDataSourceDelegate: AnyObject {
  
  /// Удалить ячейку
  /// - Parameter model: Модель ячейки
  func deleteModel(_ model: TableCellModel)
}
