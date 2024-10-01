//
//  QuoteCard.Cell.swift
//  FDUIKit
//
//  Created by Vitalii Sosin on 01.10.2024.
//

import FDStyle
import UIKit

/// Cell для экрана
extension QuoteCard {
  public final class Cell: UITableViewCell {
    
    // MARK: - Initialisation
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
      super.init(style: style, reuseIdentifier: reuseIdentifier)
      
      makeConstraints()
      backgroundColor = FDStyleAsset.constantGhost.color
      
      selectionStyle = .none
    }
    
    required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public funcs
    
    public func configure() {}
  }
}

// MARK: - Private

private extension QuoteCard.Cell {
  func makeConstraints() {
    
  }
}

// MARK: - Appearance

private extension QuoteCard.Cell {
  struct Appearance {}
}
