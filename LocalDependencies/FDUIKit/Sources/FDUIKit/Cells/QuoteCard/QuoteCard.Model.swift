//
//  QuoteCard.Model.swift
//  FDUIKit
//
//  Created by Vitalii Sosin on 01.10.2024.
//

import UIKit

extension QuoteCard {
  public final class Model: TableCellModel {
    public var cellType: (UITableViewCell & ConfigurableView & IdentifiableForReuse).Type {
      return QuoteCard.Cell.self
    }
    
    // MARK: - Initialisation

    /// Initialisation
    public init() {}
    
  }
}
