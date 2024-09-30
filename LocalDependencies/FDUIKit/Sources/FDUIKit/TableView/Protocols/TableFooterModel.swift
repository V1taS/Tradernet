//
//  TableFooterModel.swift
//  FDUIKit
//
//  Created by Vitalii Sosin on 30.09.2024.
//

import UIKit

/// Протокол хэдера для таблички
public protocol TableFooterModel {
  
  /// Тип view
  var viewType: (UITableViewHeaderFooterView & ConfigurableView & IdentifiableForReuse).Type { get }
}
