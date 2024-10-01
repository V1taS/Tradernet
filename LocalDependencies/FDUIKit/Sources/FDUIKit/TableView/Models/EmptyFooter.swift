//
//  EmptyFooter.swift
//  FDUIKit
//
//  Created by Vitalii Sosin on 01.10.2024.
//

import UIKit

/// Footer с нулевой высотой
public struct EmptyFooter: TableFooterModel, ModelWithHeight {
  
  public init() {}
  
  // MARK: - TableFooterModel
  
  public var height: CGFloat {
    return .leastNonzeroMagnitude
  }
  
  public var estimatedHeight: CGFloat {
    return .leastNonzeroMagnitude
  }
  
  // MARK: - TableFooterModel
  
  public var viewType: (UITableViewHeaderFooterView & ConfigurableView & IdentifiableForReuse).Type {
    return EmptyHeaderFooterView.self
  }
}
