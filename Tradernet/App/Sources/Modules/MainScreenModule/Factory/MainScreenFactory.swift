//
//  MainScreenFactory.swift
//  Tradernet
//
//  Created by Vitalii Sosin on 30.09.2024.
//

import Foundation
import FDAbstractions
import FDUIKit

/// Cобытия которые отправляем из Factory в Presenter
protocol MainScreenFactoryOutput: AnyObject {}

/// Cобытия которые отправляем от Presenter к Factory
protocol MainScreenFactoryInput {
  /// Создать элементы таблицы
  func createInitialElements() -> [TableSectionModel]
}

/// Фабрика
final class MainScreenFactory: MainScreenFactoryInput {
  
  // MARK: - Internal properties
  
  weak var output: MainScreenFactoryOutput?
  
  // MARK: - Internal func
  
  func createInitialElements() -> [TableSectionModel] {
    var models: [TableCellModel] = []
    
    let quoteCardModel = QuoteCard.Model(
      leftSideImage: nil,
      leftSideTitle: "FEES",
      leftSideDescription: "MSK | sevsfe",
      rightSideTitle: "+ 3.37 %",
      rightSideTitleStyle: .positiveWithBubble,
      rightSideDescription: "eswfes32s"
    )
    models.append(quoteCardModel)
    
    return [TableSection(models: models)]
  }
}

// MARK: - Appearance

private extension MainScreenFactory {
  struct Appearance {}
}
