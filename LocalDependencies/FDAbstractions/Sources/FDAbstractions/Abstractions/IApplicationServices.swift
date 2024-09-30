//
//  IApplicationServices.swift
//  FDAbstractions
//
//  Created by Vitalii Sosin on 30.09.2024.
//

import Foundation

// MARK: - IApplicationServices

public protocol IApplicationServices {
  /// Сервис для получения котировок
  var quoteService: IQuoteService { get }
  
  /// Сервис уведомлений.
  var notificationService: INotificationService { get }
}
