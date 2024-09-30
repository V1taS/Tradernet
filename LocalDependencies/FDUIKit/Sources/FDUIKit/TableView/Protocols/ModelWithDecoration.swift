//
//  ModelWithDecoration.swift
//  FDUIKit
//
//  Created by Vitalii Sosin on 30.09.2024.
//

import UIKit

/// Модель с визуальным оформлением
protocol ModelWithDecoration {
  
  /// Цвет фона
  var backgroundColor: UIColor? { get set }
  
  /// Радиус закругления углов
  var cornerRadius: CGFloat? { get set }
}
