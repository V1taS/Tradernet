//
//  QuoteCard.View.swift
//  FDUIKit
//
//  Created by Vitalii Sosin on 01.10.2024.
//

import FDStyle
import UIKit

/// View для экрана
extension QuoteCard {
  public final class View: UIView {
    
    // MARK: - Private properties
    
    // MARK: - Initialization
    
    public override init(frame: CGRect) {
      super.init(frame: frame)
      
      configureLayout()
      applyDefaultBehavior()
    }
    
    public required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Internal func
  }
}

// MARK: - Private

private extension QuoteCard.View {
  func configureLayout() {}
  
  func applyDefaultBehavior() {
    backgroundColor = FDStyleAsset.constantGhost.color
  }
}

// MARK: - Appearance

private extension QuoteCard.View {
  struct Appearance {}
}
