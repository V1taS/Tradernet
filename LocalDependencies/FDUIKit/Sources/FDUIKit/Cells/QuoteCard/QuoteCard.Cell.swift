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
    
    // MARK: - Private properties
    
    private let quoteCardView = QuoteCard.View()
    
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
    
    /// Конфигурация ячейки `QuoteCard`.
    /// - Parameters:
    ///   - leftSideImage: Изображение слевой стороны карточки.
    ///   - leftSideTitle: Заголовок слевой стороны карточки.
    ///   - leftSideDescription: Описание слевой стороны карточки.
    ///   - rightSideTitle: Заголовок правой стороны карточки.
    ///   - rightSideTitleStyle: Стиль заголовка правой стороны карточки.
    ///   - rightSideDescription: Описание правой стороны карточки.
    public func configure(
      leftSideImage: UIImage?,
      leftSideTitle: String,
      leftSideDescription: String,
      rightSideTitle: String,
      rightSideTitleStyle: QuoteCard.Style,
      rightSideDescription: String
    ) {
      quoteCardView.configure(
        leftSideImage: leftSideImage,
        leftSideTitle: leftSideTitle,
        leftSideDescription: leftSideDescription,
        rightSideTitle: rightSideTitle,
        rightSideTitleStyle: rightSideTitleStyle,
        rightSideDescription: rightSideDescription
      )
    }
  }
}

// MARK: - Private

private extension QuoteCard.Cell {
  func makeConstraints() {
    [quoteCardView].forEach {
      $0.translatesAutoresizingMaskIntoConstraints = false
      contentView.addSubview($0)
    }
    
    NSLayoutConstraint.activate([
      quoteCardView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
      quoteCardView.topAnchor.constraint(equalTo: contentView.topAnchor),
      quoteCardView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
      quoteCardView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
    ])
  }
}

// MARK: - Appearance

private extension QuoteCard.Cell {
  struct Appearance {}
}
