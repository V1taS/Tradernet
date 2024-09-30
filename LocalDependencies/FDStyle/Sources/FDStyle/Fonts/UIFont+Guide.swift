//
//  UIFont+Guide.swift
//
//  Created by Vitalii Sosin on 30.09.2024.
//

import SwiftUI

/// Расширение для `UIFont`
public extension UIFont {
  
  /// Список шрифтов
  class var fancy: UIFontGuide { UIFontGuide(text: UIFontGuide.Text(), constant: UIFontGuide.Constant()) }
}
