//
//  TableSection.swift
//  FDUIKit
//
//  Created by Vitalii Sosin on 01.10.2024.
//

import Foundation

/// Секция таблички
public struct TableSection: TableSectionModel {
  
  /// Модель  header
  public var header: TableHeaderModel?
  
  /// Модели
  public var models: [TableCellModel]
  
  /// Модель footer
  public var footer: TableFooterModel?
  
  /// Инициализатор
  /// - Parameters:
  ///   - header: модель хэдэра
  ///   - models: набор моделей в секции
  ///   - footer: модель футера
  public init(header: TableHeaderModel?,
              models: [TableCellModel],
              footer: TableFooterModel?) {
    self.header = header != nil ? header : EmptyHeader()
    self.models = models
    self.footer = footer != nil ? footer : EmptyFooter()
  }
  
  /// Инициализатор
  /// - Parameters:
  ///   - models: набор моделей в секции
  ///   - header: модель хэдэра
  ///   - footer: модель футера
  public init(models: [TableCellModel],
              header: TableHeaderModel = EmptyHeader(),
              footer: TableFooterModel = EmptyFooter()) {
    self.models = models
    self.header = header
    self.footer = footer
  }
  
  /// Инициализатор сс пустыми header и footer
  /// - Parameter models: модели
  public init(models: [TableCellModel]) {
    self.header = EmptyHeader()
    self.models = models
    self.footer = EmptyFooter()
  }
}

