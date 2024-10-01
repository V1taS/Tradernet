//
//  QuoteCard.Style.swift
//  FDUIKit
//
//  Created by Vitalii Sosin on 01.10.2024.
//

import FDStyle
import UIKit

/// View для экрана
extension QuoteCard {
  public enum Style {
    /// Текст с пузырьковым фоном
    var isBubble: Bool {
      switch self {
      case .positiveWithBubble, .negativeWithBubble:
        return true
      default:
        return false
      }
    }
    
    /// Цвет фона пузырька
    public var backgroundBubbleColor: UIColor {
      switch self {
      case .positive, .negative, .standart:
        return .clear
      case .positiveWithBubble:
        return FDStyleAsset.constantLime.color
      case .negativeWithBubble:
        return FDStyleAsset.constantRuby.color
      }
    }
    
    /// Цвет котировок
    public var textColor: UIColor? {
      switch self {
      case .positive:
        return FDStyleAsset.constantLime.color
      case .negative:
        return FDStyleAsset.constantRuby.color
      case .positiveWithBubble, .negativeWithBubble:
        return FDStyleAsset.constantGhost.color
      case .standart:
        return FDStyleAsset.constantNavy.color
      }
    }
    
    /// Положительный стиль
    case standart
    /// Положительный стиль
    case positive
    /// Отрицательный стиль
    case negative
    /// Положительный стиль с пузырём (bubble)
    case positiveWithBubble
    /// Отрицательный стиль с пузырём (bubble)
    case negativeWithBubble
  }
}
