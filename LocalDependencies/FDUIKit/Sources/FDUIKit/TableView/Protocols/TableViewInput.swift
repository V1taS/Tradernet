//
//  TableViewInput.swift
//  FDUIKit
//
//  Created by Vitalii Sosin on 30.09.2024.
//

import UIKit

/// Протокол работы с TableView
public protocol TableViewInput {
  
  /// Прокси делегата UIScrollViewDelegate
  var scrollDelegate: TableViewScrollDelegate? { get set }
  
  /// Устанавливает модели данных в таблицу
  /// - Parameter models: Модели данных для отображения в таблице
  func configure(with models: [TableSectionModel])
  
  /// Устанавливает режим скрытия клавиатуры
  /// - Parameter mode: Режим скрытия клавиатуры
  func setKeyboardDismissMode(_ mode: UITableView.KeyboardDismissMode)
  
  /// Перезагружает секции таблицы с анимацией
  /// - Parameters:
  ///   - models: Новые модели данных
  ///   - sections: Индексы секций для перезагрузки
  ///   - animation: Тип анимации для перезагрузки
  func reload(with models: [TableSectionModel], sections: IndexSet, animation: UITableView.RowAnimation)
  
  /// Удаляет секции таблицы с анимацией
  /// - Parameters:
  ///   - sections: Индексы секций для удаления
  ///   - models: Новые модели данных
  ///   - animation: Тип анимации для удаления
  func delete(sections: IndexSet, withModels models: [TableSectionModel], animation: UITableView.RowAnimation)
  
  /// Перезагружает строки таблицы с анимацией
  /// - Parameters:
  ///   - indexPaths: Индексы строк для перезагрузки
  ///   - animation: Тип анимации для перезагрузки
  ///   - sections: Новые модели данных для секций
  func reloadRows(at indexPaths: [IndexPath], with animation: UITableView.RowAnimation, dataSource sections: [TableSectionModel])
  
  /// Вставляет строки в таблицу с анимацией
  /// - Parameters:
  ///   - indexPaths: Индексы строк для вставки
  ///   - animation: Тип анимации для вставки
  ///   - sections: Новые модели данных для секций
  func insertRows(at indexPaths: [IndexPath], with animation: UITableView.RowAnimation, dataSource sections: [TableSectionModel])
  
  /// Удаляет строки из таблицы с анимацией
  /// - Parameters:
  ///   - indexPaths: Индексы строк для удаления
  ///   - animation: Тип анимации для удаления
  ///   - sections: Новые модели данных для секций
  func deleteRows(at indexPaths: [IndexPath], with animation: UITableView.RowAnimation, dataSource sections: [TableSectionModel])
  
  /// Обновляет источник данных таблицы
  /// - Parameter sections: Новые секции с данными
  func updateDataSource(_ sections: [TableSectionModel])
}
