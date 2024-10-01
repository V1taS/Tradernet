//
//  QuoteCardCell+ConfigurableView.swift
//  FDUIKit
//
//  Created by Vitalii Sosin on 01.10.2024.
//

import UIKit

// MARK: - ConfigurableView

extension QuoteCard.Cell: ConfigurableView {
  public func configure(with object: Any) {
    guard let cellModel = object as? QuoteCard.Model else { return }
    
    configure()
    separatorInset = .leftInfinite
  }
}

// MARK: - IdentifiableForReuse

extension QuoteCard.Cell: IdentifiableForReuse {
  public static var reuseId: String {
    return "QuoteCardCellReuseId"
  }
}
