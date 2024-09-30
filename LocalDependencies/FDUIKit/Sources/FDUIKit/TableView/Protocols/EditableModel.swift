//
//  EditableModel.swift
//  FDUIKit
//
//  Created by Vitalii Sosin on 30.09.2024.
//

/// Модель поддерживающая редактирование
public protocol EditableModel {

  /// Можно ли редактировать ячейку
  var isEditable: Bool { get }
}
