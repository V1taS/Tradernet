//
//  DisplayableModel.swift
//  FDUIKit
//
//  Created by Vitalii Sosin on 30.09.2024.
//

import UIKit

/// Отображаемая модель
public protocol DisplayableModel {
  
  /// View будет показана
  /// - Parameter view: view
  func willDisplay(view: UIView)
  
  /// View перстала показываться
  /// - Parameter view: view
  func didEndDisplaying(view: UIView)
}
