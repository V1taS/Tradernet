//
//  SwipeActionsModel.swift
//  FDUIKit
//
//  Created by Vitalii Sosin on 30.09.2024.
//

import UIKit

/// Модель поддерживающая редактирование
public protocol SwipeActionsModel {
  
  /// Можно ли свайпать ячейку
  var swipeActions: [UIContextualAction]? { get }
}
