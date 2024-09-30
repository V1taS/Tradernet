//
//  ModelWithHeight.swift
//  FDUIKit
//
//  Created by Vitalii Sosin on 30.09.2024.
//

import UIKit

/// Модель для отображения view с определенной высотой
public protocol ModelWithHeight {

  /// Высота для view
  var height: CGFloat { get }

  /// Предполагаемая высота view
  var estimatedHeight: CGFloat { get }
}
