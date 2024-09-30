//
//  BaseViewController.swift
//  FDUIKit
//
//  Created by Vitalii Sosin on 30.09.2024.
//

import UIKit
import FDStyle

/// Основной контроллер, который содержит в себе стандартную логику отображения экрана
open class BaseViewController: UIViewController {
  
  // MARK: - Public properies
  
  /// Модуль отображаемого контроллера (Содержит в себе логику таблицы и конфигурацию кнопки)
  public lazy var moduleView: UIView & BaseTableViewInput = BaseTableView()
  
  // MARK: - Public funcs
  
  override open func loadView() {
    moduleView.output = self
    view = moduleView
  }
  
  override open func viewDidDisappear(_ animated: Bool) {
    super.viewDidDisappear(animated)
    
    moduleView.endEditing()
  }
}

// MARK: - BaseTableViewOutput

extension BaseViewController: BaseTableViewOutput {}
