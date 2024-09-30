//
//  BaseTableView.swift
//  FDUIKit
//
//  Created by Vitalii Sosin on 30.09.2024.
//

import FDStyle
import UIKit

// MARK: - BaseTableViewOutput

/// Обработчик событий от view модуля BaseTableView
public protocol BaseTableViewOutput: AnyObject {}

// MARK: - BaseTableViewInput

/// View для экрана BaseTableView
public protocol BaseTableViewInput: AnyObject {
  
  /// Обработчик событий от view экрана с логикой
  var output: BaseTableViewOutput? { get set }
  
  /// Таблица
  var tableView: TableView { get }
  
  /// Обработчик событий от scroll view таблицы
  var scrollDelegate: TableViewScrollDelegate? { get set }
  
  /// Размер доступного контента таблицы
  var tableViewContentInset: UIEdgeInsets { get set }
  
  /// Конфигурирование view
  /// - Parameter models: Модели для отображения в таблице
  func configure(models: [TableSectionModel])
  
  /// Перезагрузка секций таблицы с анимацией
  /// - Parameters:
  ///   - models: Модели для отображения в таблице
  ///   - indexSet: Индексы обновляемых секций
  func reload(models: [TableSectionModel],
              indexSet: IndexSet)
  
  /// Перезагрузка таблицы с анимацией
  /// - Parameters:
  ///   - models: Модели для отображения в таблице
  ///   - indexSet: Индексы обновляемых секций
  ///   - animation: Анимация
  func reload(models: [TableSectionModel], indexSet: IndexSet, animation: UITableView.RowAnimation)
  
  /// Перезагрузка ячеек в определенной секции с анимацией
  /// - Parameters:
  ///   - indexPaths: Индексы обновляемых секций
  ///   - animation: Анимация
  ///   - sections: Модели секции для отображения в таблице
  func reloadRows(at indexPaths: [IndexPath],
                  with animation: UITableView.RowAnimation,
                  dataSource sections: [TableSectionModel])
  
  /// Удалить ячейки
  /// - Parameters:
  ///   - indexPaths: Индексы обновляемых секций
  ///   - animation: Анимация
  ///   - sections: Модели секции для отображения в таблице
  func deleteRows(at indexPaths: [IndexPath],
                  with animation: UITableView.RowAnimation,
                  dataSource sections: [TableSectionModel])
  
  /// Перезагружает таблицу
  func reloadData()
  
  /// Обновляет ячейки таблицу
  func beginAndEndUpdatesTableView()
  
  /// Убираем фокус с таблицы
  func endEditing()
  
  /// Показать экран загрузки
  /// - Parameter isShow: Показать лодер загрузки
  func showLoaderView(_ isShow: Bool)
}

// MARK: - BaseTableView

public final class BaseTableView: UIView, BaseTableViewInput {
  
  // MARK: - Public properties
  
  weak public var output: BaseTableViewOutput?
  
  public var tableViewContentInset: UIEdgeInsets = .zero
  
  // MARK: - Public properties
  
  public lazy var tableView: TableView = {
    let view = TableView(frame: .zero, style: configuration.style)
    view.tableFooterView = .init(frame: .init(x: 0, y: 0,  width: 0, height: CGFloat.leastNonzeroMagnitude))
    view.separatorInset = .leftInfinite
    view.rowHeight = TableView.automaticDimension
    view.setKeyboardDismissMode(.onDrag)
    view.backgroundColor = .clear
    view.tableHeaderView = .init(frame: .init(x: 0, y: 0, width: 0, height: CGFloat.leastNonzeroMagnitude))
    
    if let directionalLayoutMargins = configuration.directionalLayoutMargins {
      view.directionalLayoutMargins = directionalLayoutMargins
    }
    return view
  }()
  
  public var scrollDelegate: TableViewScrollDelegate? {
    get {
      return tableView.scrollDelegate
    }
    set {
      tableView.scrollDelegate = newValue
    }
  }
  
  private lazy var loaderView: UIActivityIndicatorView = {
    let view = UIActivityIndicatorView(style: .large)
    view.isHidden = true
    return view
  }()
  
  private var configuration: BaseTableViewConfiguration = .default
  
  // MARK: - Init
  
  public init(configuration: BaseTableViewConfiguration) {
    self.configuration = configuration
    super.init(frame: .zero)
    makeConstraints()
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = FDStyleAsset.constantGhost.color
    makeConstraints()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - BaseTableViewInput
  
  public func configure(models: [TableSectionModel]) {
    tableView.configure(with: models)
  }
  
  public func reloadData() {
    tableView.reloadData()
  }
  
  public func reload(models: [TableSectionModel],
                     indexSet: IndexSet) {
    tableView.reload(with: models,
                     sections: indexSet,
                     animation: .automatic)
  }
  
  public func reload(
    models: [TableSectionModel],
    indexSet: IndexSet,
    animation: UITableView.RowAnimation
  ) {
    tableView.reload(with: models,
                     sections: indexSet,
                     animation: animation)
  }
  
  public func reloadRows(at indexPaths: [IndexPath],
                         with animation: UITableView.RowAnimation,
                         dataSource sections: [TableSectionModel]) {
    tableView.reloadRows(at: indexPaths,
                         with: animation,
                         dataSource: sections)
  }
  
  public func deleteRows(at indexPaths: [IndexPath],
                         with animation: UITableView.RowAnimation,
                         dataSource sections: [TableSectionModel]) {
    tableView.deleteRows(at: indexPaths,
                         with: animation,
                         dataSource: sections)
  }
  
  public func beginAndEndUpdatesTableView() {
    tableView.beginUpdates()
    tableView.endUpdates()
  }
  
  public func endEditing() {
    tableView.endEditing(true)
  }
  
  public func showLoaderView(_ isShow: Bool) {
    tableView.isHidden = isShow
    loaderView.isHidden = !isShow
    if isShow {
      loaderView.startAnimating()
    } else {
      loaderView.stopAnimating()
    }
  }
}

// MARK: - Private

private extension BaseTableView {
  func makeConstraints() {
    [tableView, loaderView].forEach {
      $0.translatesAutoresizingMaskIntoConstraints = false
      addSubview($0)
    }
    
    NSLayoutConstraint.activate([
      tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
      tableView.topAnchor.constraint(equalTo: topAnchor),
      tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
      tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
    ])
  }
  
  func setupTableViewContentInset(_ bottom: CGFloat) {
    tableView.contentInset = .init(horizontal: .zero,
                                   top: .zero,
                                   bottom: bottom)
    tableViewContentInset = tableView.contentInset
  }
}
