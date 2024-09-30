//
//  MainScreenInteractor.swift
//  Tradernet
//
//  Created by Vitalii Sosin on 30.09.2024.
//

import Foundation
import FDAbstractions

/// События которые отправляем из Interactor в Presenter
protocol MainScreenInteractorOutput: AnyObject {
  /// Были получены новые котировки
  /// - Parameters:
  ///  - quoteData: Данные по котировкам
  func didReceiveQuoteData(_ quoteData: QuoteData)
  
  /// Была получена ошибка
  /// - Parameters:
  ///  - error: Данные по котировкам
  func didReceiveError(_ error: Error)
}

/// События которые отправляем от Presenter к Interactor
protocol MainScreenInteractorInput {
  /// Запуск сервиса котировок
  func start()
  
  /// Остановка сервиса
  func stop()
  
  /// Показать уведомление
  /// - Parameters:
  ///   - type: Тип уведомления
  func showNotification(_ type: NotificationServiceType)
}

/// Интерактор
final class MainScreenInteractor: MainScreenInteractorInput {
  
  // MARK: - Internal properties
  
  weak var output: MainScreenInteractorOutput?
  
  // MARK: - Private properties
  
  private let quoteService: IQuoteService
  private let notificationService: INotificationService
  
  // MARK: - Initialization
  
  /// - Parameters:
  ///   - services: Сервисы
  init(services: IApplicationServices) {
    quoteService = services.quoteService
    notificationService = services.notificationService
  }
  
  // MARK: - Internal func
  
  func start() {
    quoteService.start(tickers: Ticker.allCases) { [weak self] quoteData in
      DispatchQueue.main.async {
        self?.output?.didReceiveQuoteData(quoteData)
      }
    } onError: { [weak self] error in
      DispatchQueue.main.async {
        self?.output?.didReceiveError(error)
      }
    }
  }
  
  func stop() {
    quoteService.stop()
  }
  
  func showNotification(_ type: NotificationServiceType) {
    notificationService.showNotification(type)
  }
}

// MARK: - Appearance

private extension MainScreenInteractor {
  struct Appearance {}
}
