//
//  EmptyHeader.swift
//  FDUIKit
//
//  Created by Vitalii Sosin on 01.10.2024.
//

import Foundation
import UIKit

/// Модель с пустым хедером для таблицы
public struct EmptyHeader: TableHeaderModel, ModelWithHeight {
  
  public init() {}
  
  // MARK: - ModelWithHeight
  
  public var height: CGFloat {
    return .leastNonzeroMagnitude
  }
  
  public var estimatedHeight: CGFloat {
    return .leastNonzeroMagnitude
  }
  
  // MARK: - TableHeaderModel
  
  public var viewType: (UITableViewHeaderFooterView & ConfigurableView & IdentifiableForReuse).Type {
    return EmptyHeaderFooterView.self
  }
}
