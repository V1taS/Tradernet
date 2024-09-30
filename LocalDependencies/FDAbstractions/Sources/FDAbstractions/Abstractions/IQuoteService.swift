//
//  IQuoteService.swift
//  FDAbstractions
//
//  Created by Vitalii Sosin on 30.09.2024.
//

import Foundation

/// Протокол сервиса для получения котировок
public protocol IQuoteService {
  /// Запуск сервиса
  /// - Parameters:
  ///   - tickers: Массив тикеров для подписки
  ///   - onDataReceived: Замыкание, вызываемое при получении новых данных
  ///   - onError: Замыкание, вызываемое при возникновении ошибки
  func start(tickers: [Ticker], onDataReceived: @escaping (QuoteData) -> Void, onError: @escaping (Error) -> Void)
  
  /// Остановка сервиса
  func stop()
}
