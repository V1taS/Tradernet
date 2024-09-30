//
//  TableViewScrollDelegate.swift
//  FDUIKit
//
//  Created by Vitalii Sosin on 30.09.2024.
//

import UIKit

// MARK: - TableViewScrollDelegate

/**
 Этот протокол проксирует методы, объявленные в протоколе `UIScrollViewDelegate`, что позволяет объекту-делегату
 реагировать на сообщения от класса `UIScrollView`, а также влиять на операции, такие как прокрутка, масштабирование,
 замедление прокрученного контента и анимации прокрутки.
 */
public protocol TableViewScrollDelegate: AnyObject {
  /// Сообщает делегату о том, что пользователь прокрутил содержимое вью.
  /// - Parameter scrollView: Объект scroll-view, в котором произошла прокрутка.
  func scrollViewDidScroll(_ scrollView: UIScrollView)
  
  /// Вызывается при начале перетаскивания (может потребоваться некоторое время или расстояние для перемещения)
  /// - Parameter scrollView: Объект scroll-view, в котором произошла прокрутка.
  func scrollViewWillBeginDragging(_ scrollView: UIScrollView)
}

// MARK: - Реализация по умолчанию ничего не делает

public extension TableViewScrollDelegate {
  func scrollViewDidScroll(_ scrollView: UIScrollView) {}
  func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {}
}
