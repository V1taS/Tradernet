//
//  IdentifiableForReuse.swift
//  FDUIKit
//
//  Created by Vitalii Sosin on 30.09.2024.
//

import Foundation

/// Протокол view с ReuseId
public protocol IdentifiableForReuse {
  
  /// Идентификатор для переиспользования
  static var reuseId: String { get }
}
