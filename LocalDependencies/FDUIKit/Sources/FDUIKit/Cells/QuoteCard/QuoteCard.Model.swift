//
//  QuoteCard.Model.swift
//  FDUIKit
//
//  Created by Vitalii Sosin on 01.10.2024.
//

import UIKit

extension QuoteCard {
  
  /// Модель для ячейки `QuoteCard`
  public final class Model: TableCellModel {
    
    // MARK: - Public Properties
    
    /// Изображение слевой стороны карточки
    public let leftSideImage: UIImage?
    
    /// Заголовок слевой стороны карточки
    public let leftSideTitle: String
    
    /// Описание слевой стороны карточки
    public let leftSideDescription: String
    
    /// Заголовок правой стороны карточки
    public let rightSideTitle: String
    
    /// Стиль заголовка правой стороны карточки
    public let rightSideTitleStyle: QuoteCard.Style
    
    /// Описание правой стороны карточки
    public let rightSideDescription: String
    
    /// Тип ячейки таблицы, используемой для отображения модели
    public var cellType: (UITableViewCell & ConfigurableView & IdentifiableForReuse).Type {
      return QuoteCard.Cell.self
    }
    
    // MARK: - Initialisation
    
    /// Инициализатор модели `QuoteCard`.
    /// - Parameters:
    ///   - leftSideImage: Изображение слевой стороны карточки.
    ///   - leftSideTitle: Заголовок слевой стороны карточки.
    ///   - leftSideDescription: Описание слевой стороны карточки.
    ///   - rightSideTitle: Заголовок правой стороны карточки.
    ///   - rightSideTitleStyle: Стиль заголовка правой стороны карточки.
    ///   - rightSideDescription: Описание правой стороны карточки.
    public init(
      leftSideImage: UIImage?,
      leftSideTitle: String,
      leftSideDescription: String,
      rightSideTitle: String,
      rightSideTitleStyle: QuoteCard.Style,
      rightSideDescription: String
    ) {
      self.leftSideImage = leftSideImage
      self.leftSideTitle = leftSideTitle
      self.leftSideDescription = leftSideDescription
      self.rightSideTitle = rightSideTitle
      self.rightSideTitleStyle = rightSideTitleStyle
      self.rightSideDescription = rightSideDescription
    }
  }
}
