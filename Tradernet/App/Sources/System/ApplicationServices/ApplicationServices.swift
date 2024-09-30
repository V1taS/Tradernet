//
//  ApplicationServices.swift
//  Tradernet
//
//  Created by Vitalii Sosin on 30.09.2024.
//  Copyright © 2024 SosinVitalii.com. All rights reserved.
//

import Foundation
import FDAbstractions
import FDServices

// MARK: - ApplicationServices

final class ApplicationServices: IApplicationServices {
  /// Сервис для получения котировок
  var quoteService: IQuoteService {
    QuoteService()
  }
  
  /// Сервис уведомлений.
  var notificationService: INotificationService {
    NotificationService()
  }
}
