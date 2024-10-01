//
//  HeaderFooterView.swift
//  FDUIKit
//
//  Created by Vitalii Sosin on 01.10.2024.
//

import UIKit

public class EmptyHeaderFooterView: UITableViewHeaderFooterView, ConfigurableView, IdentifiableForReuse {
  
  // MARK: - IdentifiableForReuse
  public static var reuseId: String {
    return String(describing: EmptyHeaderFooterView.self)
  }
  
  // MARK: - ConfigurableView
  public func configure(with object: Any) {
    frame = .init(x: 0, y: 0, width: 0, height: CGFloat.leastNonzeroMagnitude)
  }
}
