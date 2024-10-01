//
//  MainScreenFactory.swift
//  Tradernet
//
//  Created by Vitalii Sosin on 30.09.2024.
//

import Foundation
import FDAbstractions
import FDUIKit

/// События которые отправляем из Factory в Presenter
protocol MainScreenFactoryOutput: AnyObject {
  /// Вызывается, когда добавлены новые модели
  /// - Parameter models: Массив секций таблицы
  func didAddModels(_ models: [TableSectionModel])
  
  /// Вызывается, когда обновлены существующие модели
  /// - Parameters:
  ///   - models: Массив секций таблицы
  ///   - updateModel: Модель которую надо обновить
  func didUpdateModels(_ models: [TableSectionModel], updateModel: TableCellModel)
}

/// События которые отправляем от Presenter к Factory
protocol MainScreenFactoryInput {
  /// Создать элементы таблицы
  /// - Parameter quoteData: Моделька с данными
  func createInitialElements(_ quoteData: QuoteData)
}

/// Фабрика
final class MainScreenFactory: MainScreenFactoryInput {
  
  // MARK: - Internal properties
  
  weak var output: MainScreenFactoryOutput?
  
  // MARK: - Private properties
  
  private var quoteCache: [String: QuoteCacheItem] = [:]
  private var models: [QuoteCard.Model] = []
  
  // MARK: - Internal func
  
  func createInitialElements(_ quoteData: QuoteData) {
    let tickerSymbol = quoteData.ticker.rawValue
    
    if let cacheItem = quoteCache[tickerSymbol] {
      let oldChangeInPercent = cacheItem.quoteData.changeInPercent
      let newChangeInPercent = quoteData.changeInPercent
      
      var style: QuoteCard.Style
      if newChangeInPercent > 0 {
        style = .positive
      } else if newChangeInPercent < 0 {
        style = .negative
      } else {
        style = .standart
      }
      
      if newChangeInPercent > oldChangeInPercent {
        style = .positiveWithBubble
        startBubbleTimer(for: cacheItem, positive: true)
      } else if newChangeInPercent < oldChangeInPercent {
        style = .negativeWithBubble
        startBubbleTimer(for: cacheItem, positive: false)
      }
      
      let newQuoteData = QuoteData(
        ticker: quoteData.ticker,
        lastPrice: quoteData.lastPrice,
        changeInPoints: quoteData.changeInPoints,
        changeInPercent: quoteData.changeInPercent,
        lastTradeExchange: cacheItem.quoteData.lastTradeExchange,
        name: cacheItem.quoteData.name,
        lastTradeTime: cacheItem.quoteData.lastTradeTime
      )
      
      cacheItem.quoteData = newQuoteData
      cacheItem.model = createQuoteCardModel(from: newQuoteData, style: style)
      
      if let rowIndex = models.firstIndex(where: { $0.leftSideTitle == tickerSymbol }) {
        models[rowIndex] = cacheItem.model
        let section = TableSection(models: models)
        output?.didUpdateModels([section], updateModel: cacheItem.model)
      }
    } else {
      // Новая котировка, создаем её
      var style: QuoteCard.Style
      if quoteData.changeInPercent > .zero {
        style = .positive
      } else if quoteData.changeInPercent < .zero {
        style = .negative
      } else {
        style = .standart
      }
      let model = createQuoteCardModel(from: quoteData, style: style)
      let cacheItem = QuoteCacheItem(quoteData: quoteData, model: model)
      
      quoteCache[tickerSymbol] = cacheItem
      models.append(model)
      
      let section = TableSection(models: models)
      output?.didAddModels([section])
    }
  }
}

// MARK: - Private

private extension MainScreenFactory {
  func createQuoteCardModel(from quoteData: QuoteData, style: QuoteCard.Style) -> QuoteCard.Model {
    return QuoteCard.Model(
      leftSideImage: nil,
      leftSideTitle: quoteData.ticker.rawValue,
      leftSideDescription: quoteData.name ?? "",
      rightSideTitle: "\(quoteData.changeInPercent) %",
      rightSideTitleStyle: style,
      rightSideDescription: "\(quoteData.lastPrice) (\(quoteData.changeInPoints))"
    )
  }
  
  func startBubbleTimer(for cacheItem: QuoteCacheItem, positive: Bool) {
    cacheItem.timer?.invalidate()
    cacheItem.timer = Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { [weak self, weak cacheItem] _ in
      guard let self = self, let cacheItem = cacheItem else { return }
      let style: QuoteCard.Style = positive ? .positive : .negative
      cacheItem.model.rightSideTitleStyle = style
      
      if let rowIndex = self.models.firstIndex(where: { $0.leftSideTitle == cacheItem.model.leftSideTitle }) {
        self.models[rowIndex] = cacheItem.model
        let section = TableSection(models: self.models)
        self.output?.didUpdateModels([section], updateModel: cacheItem.model)
      }
    }
  }
}

// MARK: - Appearance

private extension MainScreenFactory {
  struct Appearance {}
}
