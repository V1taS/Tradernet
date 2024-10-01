//
//  QuoteData.swift
//  FDAbstractions
//
//  Created by Vitalii Sosin on 30.09.2024.
//

import Foundation

/// Публичная структура данных котировки
public struct QuoteData {
  /// Тикер
  public let ticker: Ticker
  /// Цена последней сделки
  public let lastPrice: Double
  /// Изменение цены последней сделки в пунктах относительно цены закрытия предыдущей торговой сессии
  public let changeInPoints: Double
  /// Изменение в процентах относительно цены закрытия предыдущей торговой сессии
  public let changeInPercent: Double
  /// Биржа последней сделки
  public let lastTradeExchange: String?
  /// Название бумаги
  public let name: String?
  /// Время последней сделки
  public let lastTradeTime: String?
  
  /// Публичный инициализатор для структуры `QuoteData`
  /// - Parameters:
  ///   - ticker: Тикер
  ///   - lastPrice: Цена последней сделки
  ///   - changeInPoints: Изменение цены в пунктах
  ///   - changeInPercent: Изменение в процентах
  ///   - lastTradeExchange: Биржа последней сделки
  ///   - name: Название бумаги
  ///   - lastTradeTime: Время последней сделки
  public init(
    ticker: Ticker,
    lastPrice: Double,
    changeInPoints: Double,
    changeInPercent: Double,
    lastTradeExchange: String? = nil,
    name: String? = nil,
    lastTradeTime: String? = nil
  ) {
    self.ticker = ticker
    self.lastPrice = lastPrice
    self.changeInPoints = changeInPoints
    self.changeInPercent = changeInPercent
    self.lastTradeExchange = lastTradeExchange
    self.name = name
    self.lastTradeTime = lastTradeTime
  }
}
