//
//  UIViewController+Navigation.swift
//  FDUIKit
//
//  Created by Vitalii Sosin on 30.09.2024.
//

import UIKit

// MARK: - Navigation

extension UIViewController {
  /// Возвращает самый верхний контроллер в иерархии модальных представлений.
  public static var topController: UIViewController? {
    var topController: UIViewController? = UIApplication.currentWindow?.rootViewController
    while let presentedViewController = topController?.presentedViewController {
      topController = presentedViewController
    }
    return topController
  }
  
  /// Устанавливает текущий контроллер как корневой для основного окна приложения.
  public func presentAsRoot(animated: Bool = false) {
    let window = UIApplication.currentWindow
    if let rootViewController = window?.rootViewController {
      /// Очистка всех дочерних контроллеров
      rootViewController.children.forEach {
        $0.willMove(toParent: nil)
        $0.view.removeFromSuperview()
        $0.removeFromParent()
      }
      rootViewController.view.removeFromSuperview()
    }
    
    window?.rootViewController = self
    
    if animated {
      guard let snapshot = window?.snapshotView(afterScreenUpdates: true) else {
        return
      }
      self.view.addSubview(snapshot)
      
      UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseOut, animations: {
        snapshot.layer.opacity = .zero
      }) { _ in
        snapshot.removeFromSuperview()
      }
    }
  }
  
  /// Оборачивает текущий контроллер в навигационный контроллер.
  public func wrapToNavigationController() -> UINavigationController {
    let navigationController = UINavigationController(rootViewController: self)
    return navigationController
  }
  
  /// Показывает модальное окно и заголовком.
  /// - Parameters:
  ///   - title: Заголовок, который будет отображен в модальном окне.
  public func showAlert(title: String) {
    let alert = UIAlertController(title: title, message: "", preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
    present(alert, animated: true, completion: nil)
  }
}

// MARK: - UIApplication

extension UIApplication {
  /// Возвращает текущее активное окно приложения.
  public static var currentWindow: UIWindow? {
    if #available(iOS 13.0, *) {
      return UIApplication.shared.connectedScenes
        .compactMap { $0 as? UIWindowScene }
        .flatMap { $0.windows }
        .first(where: { $0.isKeyWindow })
    } else {
      return UIApplication.shared.keyWindow
    }
  }
  
  /// Возвращает текущее WindowScene приложения.
  @available(iOS 13.0, *)
  public static var currentWindowScene: UIWindowScene? {
    return UIApplication.shared.connectedScenes
      .compactMap { $0 as? UIWindowScene }
      .first
  }
}
