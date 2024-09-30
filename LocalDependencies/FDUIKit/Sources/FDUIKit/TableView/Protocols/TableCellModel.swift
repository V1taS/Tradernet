//
//  TableCellModel.swift
//  FDUIKit
//
//  Created by Vitalii Sosin on 30.09.2024.
//

import UIKit

/// Модель для отображения в табличке
public protocol TableCellModel {
  
  /// Тип ячейки
  var cellType: (UITableViewCell & ConfigurableView & IdentifiableForReuse).Type { get }
}

/// Внутренний протокол для дженерик ячеек
protocol ModelWithCellSetup: TableCellModel {
  
  /// Настраивает ячейку
  func setup(cell: UITableViewCell)
}
