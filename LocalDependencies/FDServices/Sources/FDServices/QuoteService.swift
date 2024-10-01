//
//  QuoteService.swift
//  FDServices
//
//  Created by Vitalii Sosin on 30.09.2024.
//

import Foundation
import Starscream
import FDAbstractions

/// Сервис для получения котировок
public final class QuoteService: IQuoteService, WebSocketDelegate {
  public init() {}
  
  // MARK: - Private properties
  
  private var socket: WebSocket!
  private var onDataReceived: ((QuoteData) -> Void)?
  private var onError: ((Error) -> Void)?
  private var isConnected = false
  private var tickers: [Ticker] = []
  
  // MARK: - Public funcs
  
  public func start(tickers: [Ticker], onDataReceived: @escaping (QuoteData) -> Void, onError: @escaping (Error) -> Void) {
    self.tickers = tickers
    self.onDataReceived = onDataReceived
    self.onError = onError
    
    guard let url = URL(string: "wss://wss.tradernet.com") else {
      let error = NSError(domain: "QuoteService", code: .zero, userInfo: [NSLocalizedDescriptionKey: "Недопустимый URL"])
      onError(error)
      return
    }
    
    var request = URLRequest(url: url)
    socket = WebSocket(request: request)
    socket.delegate = self
    socket.connect()
  }
  
  public func stop() {
    socket.disconnect()
    isConnected = false
  }
  
  // MARK: - WebSocketDelegate методы
  
  public func didReceive(event: Starscream.WebSocketEvent, client: any Starscream.WebSocketClient) {
    switch event {
    case .connected:
      isConnected = true
      subscribeToQuotes()
    case let .disconnected(reason, code):
      isConnected = false
    case .text(let text):
      handleMessage(text)
    case .binary(_):
      break
    case let .error(error):
      isConnected = false
      if let error = error {
        onError?(error)
      }
    case .cancelled:
      isConnected = false
    default:
      break
    }
  }
}

// MARK: - Private

private extension QuoteService {
  func handleMessage(_ text: String) {
    guard let data = text.data(using: .utf8) else {
      return
    }
    guard let jsonArray = try? JSONSerialization.jsonObject(with: data, options: []) as? [Any] else {
      return
    }
    guard jsonArray.count >= 2 else {
      return
    }
    guard let event = jsonArray[0] as? String,
          let payload = jsonArray[1] as? [String: Any],
          event == "q" else {
      return
    }
    
    // Извлекаем обязательный тикер
    guard let tickerString = payload["c"] as? String,
          let ticker = Ticker(rawValue: tickerString),
          let lastPrice = payload["ltp"] as? Double,
          let changeInPoints = payload["chg"] as? Double,
          let changeInPercent = payload["pcp"] as? Double else {
      return
    }
    
    let lastTradeExchange = payload["ltr"] as? String
    let name = payload["name"] as? String
    let lastTradeTime = payload["ltt"] as? String
    
    let quoteData = QuoteData(
      ticker: ticker,
      lastPrice: lastPrice,
      changeInPoints: changeInPoints,
      changeInPercent: changeInPercent,
      lastTradeExchange: lastTradeExchange,
      name: name,
      lastTradeTime: lastTradeTime
    )
    
    onDataReceived?(quoteData)
  }
  
  func subscribeToQuotes() {
    let tickerValues = tickers.map { $0.rawValue }
    let subscription: [Any] = ["realtimeQuotes", tickerValues]
    if let data = try? JSONSerialization.data(withJSONObject: subscription, options: []),
       let jsonString = String(data: data, encoding: .utf8) {
      socket.write(string: jsonString)
    }
  }
}
