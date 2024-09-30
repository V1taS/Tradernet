//
//  UIEdgeInsets+Style.swift
//  FDUIKit
//
//  Created by Vitalii Sosin on 30.09.2024.
//

import UIKit

public extension UIEdgeInsets {
  init(horizontal: CGFloat, vertical: CGFloat) {
    self.init(top: vertical, left: horizontal, bottom: vertical, right: horizontal)
  }
  
  init(uniform: CGFloat) {
    self.init(top: uniform, left: uniform, bottom: uniform, right: uniform)
  }
  
  func insetBy(top: CGFloat = 0, left: CGFloat = 0, right: CGFloat = 0, bottom: CGFloat = 0) -> UIEdgeInsets {
    UIEdgeInsets(top: self.top + top, left: self.left + left, bottom: self.bottom + bottom, right: self.right + right)
  }
  
  init(horizontal: CGFloat, top: CGFloat, bottom: CGFloat) {
    self.init(top: top, left: horizontal, bottom: bottom, right: horizontal)
  }
  
  init(vertical: CGFloat = 0, horizontal: CGFloat = 0) {
    self.init(top: vertical, left: horizontal, bottom: vertical, right: horizontal)
  }
  
  init(_ uniform: CGFloat) {
    self.init(vertical: uniform, horizontal: uniform)
  }
  
  func with(left: CGFloat, right: CGFloat) -> UIEdgeInsets {
    return UIEdgeInsets(top: top, left: left, bottom: bottom, right: right)
  }
  
  static var longSeparatorInsets: UIEdgeInsets {
    return UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
  }
  
  static var imageCellSeparatorInsets: UIEdgeInsets {
    return UIEdgeInsets(top: 0, left: 76, bottom: 0, right: 16)
  }
  
  static var leftInfinite: UIEdgeInsets {
    return UIEdgeInsets(top: 0, left: .greatestFiniteMagnitude, bottom: 0, right: 0)
  }
  
  var vertical: CGFloat {
    return bottom + top
  }
  
  var horizontal: CGFloat {
    return left + right
  }
}

// MARK: - Style

public extension UIEdgeInsets {
  enum Style {
    case longSeparatorInsets
    case imageCellSeparatorInsets
    case hidden
    
    public var rawValue: UIEdgeInsets {
      switch self {
      case .longSeparatorInsets:
        return UIEdgeInsets.longSeparatorInsets
      case .imageCellSeparatorInsets:
        return UIEdgeInsets.imageCellSeparatorInsets
      case .hidden:
        return UIEdgeInsets.leftInfinite
      }
    }
  }
}

// MARK: - Hashable

extension UIEdgeInsets: Hashable {
  public func hash(into hasher: inout Hasher) {
    hasher.combine(top)
    hasher.combine(left)
    hasher.combine(bottom)
    hasher.combine(right)
  }
}
