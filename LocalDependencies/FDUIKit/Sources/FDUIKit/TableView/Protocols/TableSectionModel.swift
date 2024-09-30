//
//  TableSectionModel.swift
//  FDUIKit
//
//  Created by Vitalii Sosin on 30.09.2024.
//

import Foundation

/// Модель секции для таблицы
public protocol TableSectionModel {
  
  /// Хедер
  var header: TableHeaderModel? { get }
  
  /// Модели
  var models: [TableCellModel] { get }
  
  /// Футер
  var footer: TableFooterModel? { get }
}
