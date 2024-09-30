//
//  NotificationService.swift
//  FDServices
//
//  Created by Vitalii Sosin on 30.09.2024.
//

import SwiftUI
import FDNotifications
import FDStyle
import FDAbstractions

public final class NotificationService: INotificationService {
  public init() {}
  
  private let notifications = Notifications()
  
  public func showNotification(_ type: NotificationServiceType) {
    DispatchQueue.main.async { [weak self] in
      self?.showNotification(type, action: nil)
    }
  }
  
  public func showNotification(
    _ type: NotificationServiceType,
    action: (() -> Void)?
  ) {
    var backgroundColor: UIColor {
      switch type {
      case .positive:
        return FDStyleAsset.constantLime.color
      case .neutral:
        return FDStyleAsset.constantAzure.color
      case .negative:
        return FDStyleAsset.constantRuby.color
      }
    }
    
    notifications.showAlertWith(
      model: NotificationsModel(
        text: type.title,
        textColor: .black,
        style: .custom(
          backgroundColor: backgroundColor,
          glyph: nil,
          colorGlyph: nil
        ),
        timeout: Constants.timeout,
        glyph: false,
        throttleDelay: Constants.throttleDelay,
        action: action
      )
    )
  }
}

// MARK: - Constants

private enum Constants {
  static let timeout: Double = 2
  static let throttleDelay: Double = 0.5
  static let systemFontSize: CGFloat = 44
}
