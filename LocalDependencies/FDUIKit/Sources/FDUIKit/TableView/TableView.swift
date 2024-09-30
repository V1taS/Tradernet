//
//  TableView.swift
//  FDUIKit
//
//  Created by Vitalii Sosin on 30.09.2024.
//

import UIKit
import FDStyle

/// UITableView которая умеет отображать модели TableCellModel
public final class TableView: UITableView {
  
  public weak var scrollDelegate: TableViewScrollDelegate?
  public weak var editableDataSourceDelegate: EditableDataSourceDelegate?
  public private(set) var sections: [TableSectionModel]
  private var registeredIdentifiers: Set<String>
  private var registeredHeaderFooterIdentifiers: Set<String>
  
  public override init(frame: CGRect, style: UITableView.Style) {
    sections = []
    registeredIdentifiers = []
    registeredHeaderFooterIdentifiers = []
    super.init(frame: frame, style: style)
    delegate = self
    dataSource = self
    backgroundColor = FDStyleAsset.constantGhost.color
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension TableView: TableViewInput {
  public func configure(with sections: [TableSectionModel]) {
    register(sections: sections)
    sections.forEach({ section in
      register(models: section.models)
    })
    self.sections = sections
    reloadData()
  }
  
  public func setKeyboardDismissMode(_ mode: UITableView.KeyboardDismissMode) {
    keyboardDismissMode = mode
  }
  
  public func reload(with models: [TableSectionModel], sections: IndexSet, animation: UITableView.RowAnimation) {
    registerAll(sections: models)
    self.sections = models
    reloadSections(sections, with: animation)
  }
  
  public func delete(sections: IndexSet, withModels models: [TableSectionModel], animation: UITableView.RowAnimation) {
    registerAll(sections: models)
    self.sections = models
    deleteSections(sections, with: animation)
  }
  
  public func reloadRows(
    at indexPaths: [IndexPath],
    with animation: UITableView.RowAnimation,
    dataSource sections: [TableSectionModel]
  ) {
    registerAll(sections: sections)
    self.sections = sections
    reloadRows(at: indexPaths, with: animation)
  }
  
  public func insertRows(at indexPaths: [IndexPath], with animation: UITableView.RowAnimation, dataSource sections: [TableSectionModel]) {
    updateDataSource(sections)
    insertRows(at: indexPaths, with: animation)
  }
  
  public func deleteRows(at indexPaths: [IndexPath], with animation: UITableView.RowAnimation, dataSource sections: [TableSectionModel]) {
    self.sections = sections
    deleteRows(at: indexPaths, with: animation)
  }
  
  public func updateDataSource(_ sections: [TableSectionModel]) {
    registerAll(sections: sections)
    self.sections = sections
  }
  
  // MARK: - Private
  
  private func registerAll(sections: [TableSectionModel]) {
    register(sections: sections)
    sections.forEach({ section in
      register(models: section.models)
    })
  }
}

extension TableView: UITableViewDelegate {
  
  // MARK: - Selections
  public func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
    let model = sections[indexPath.section].models[indexPath.row]
    
    if let selectableModel = model as? SelectableModel,
       selectableModel.willSelect() {
      return selectableModel.alterSelectedIndexPath ?? indexPath
    }
    
    if let _ = model as? ActionableModel {
      return indexPath
    }
    
    return nil
  }
  
  public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let model = sections[indexPath.section].models[indexPath.row]
    
    if let actionModel = model as? ActionableModel {
      actionModel.action()
      deselectRow(at: indexPath, animated: true)
    }
    
    (model as? SelectableModel)?.didSelect()
  }
  
  public func tableView(_ tableView: UITableView, willDeselectRowAt indexPath: IndexPath) -> IndexPath? {
    let model = sections[indexPath.section].models[indexPath.row]
    
    if let selectableModel = model as? SelectableModel,
       selectableModel.willDeselect() {
      return selectableModel.alterSelectedIndexPath ?? indexPath
    }
    return nil
  }
  
  public func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
    let model = sections[indexPath.section].models[indexPath.row]
    (model as? SelectableModel)?.didDeselect()
  }
  
  // MARK: - Displaying cells
  public func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    let section = sections[indexPath.section]
    let model = section.models[indexPath.row]
    (model as? DisplayableModel)?.willDisplay(view: cell)
    
    if let backgroundColor = (section as? ModelWithDecoration)?.backgroundColor {
      cell.backgroundColor = backgroundColor
    }
    
    if let cornerRadius = (section as? ModelWithDecoration)?.cornerRadius {
      cell.layer.cornerRadius = cornerRadius
    }
  }
  
  public func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    guard indexPath.section < sections.count, indexPath.row < sections[indexPath.section].models.count else {
      return
    }
    let model = sections[indexPath.section].models[indexPath.row]
    (model as? DisplayableModel)?.didEndDisplaying(view: cell)
  }
  
  // MARK: - Displaying headers and footers
  public func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
    let headerModel = sections[section].header
    (headerModel as? DisplayableModel)?.willDisplay(view: view)
  }
  
  public func tableView(_ tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {
    let footerModel = sections[section].header
    (footerModel as? DisplayableModel)?.willDisplay(view: view)
  }
  
  public func tableView(_ tableView: UITableView, didEndDisplayingHeaderView view: UIView, forSection section: Int) {
    guard section < sections.count else {
      return
    }
    let headerModel = sections[section].header
    (headerModel as? DisplayableModel)?.didEndDisplaying(view: view)
  }
  
  public func tableView(_ tableView: UITableView, didEndDisplayingFooterView view: UIView, forSection section: Int) {
    guard section < sections.count else {
      return
    }
    let footerModel = sections[section].header
    (footerModel as? DisplayableModel)?.didEndDisplaying(view: view)
  }
  
  // MARK: - Providing height for cells
  public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    let model = sections[indexPath.section].models[indexPath.row]
    if let modelWithHeight = model as? ModelWithHeight {
      return modelWithHeight.height
    }
    return UITableView.automaticDimension
  }
  
  public func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
    let model = sections[indexPath.section].models[indexPath.row]
    if let modelWithHeight = model as? ModelWithHeight {
      return modelWithHeight.estimatedHeight
    }
    return UITableView.automaticDimension
  }
  
  // MARK: - Providing height for headers
  
  public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    let headerModel = sections[section].header
    if let modelWithHeight = headerModel as? ModelWithHeight {
      return modelWithHeight.height
    }
    return UITableView.automaticDimension
  }
  
  public func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
    let headerModel = sections[section].header
    if let modelWithHeight = headerModel as? ModelWithHeight {
      return modelWithHeight.estimatedHeight
    }
    return UITableView.automaticDimension
  }
  
  // MARK: - Providing height for footers
  public func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
    let footerModel = sections[section].footer
    if let modelWithHeight = footerModel as? ModelWithHeight {
      return modelWithHeight.height
    }
    return UITableView.automaticDimension
  }
  
  public func tableView(_ tableView: UITableView, estimatedHeightForFooterInSection section: Int) -> CGFloat {
    let footerModel = sections[section].footer
    if let modelWithHeight = footerModel as? ModelWithHeight {
      return modelWithHeight.estimatedHeight
    }
    return UITableView.automaticDimension
  }
  
  // MARK: - Providing view for header
  public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    guard let headerModel = sections[section].header else { return nil }
    let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: headerModel.viewType.reuseId)
    (view as? ConfigurableView)?.configure(with: headerModel)
    return view
  }
  
  public func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
    guard let footerModel = sections[section].footer else { return nil }
    let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: footerModel.viewType.reuseId)
    (view as? ConfigurableView)?.configure(with: footerModel)
    return view
  }
  
  // MARK: - Scroll
  
  public func scrollViewDidScroll(_ scrollView: UIScrollView) {
    scrollDelegate?.scrollViewDidScroll(scrollView)
  }
  
  public func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
    scrollDelegate?.scrollViewWillBeginDragging(scrollView)
  }
}

extension TableView: UITableViewDataSource {
  public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let models = sections[indexPath.section].models
    let model = models[indexPath.row]
    let cell = tableView.dequeueReusableCell(withIdentifier: model.cellType.reuseId,
                                             for: indexPath)
    if let modelWithSetup = model as? ModelWithCellSetup {
      modelWithSetup.setup(cell: cell)
      return cell
    }
    guard let configurableCell = cell as? UITableViewCell & ConfigurableView else {
      return cell
    }
    configurableCell.configure(with: model)
    return configurableCell
  }
  
  public func numberOfSections(in tableView: UITableView) -> Int {
    return sections.count
  }
  
  public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    let section = sections[section]
    return section.models.count
  }
  
  public func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
    let model = sections[indexPath.section].models[indexPath.row]
    
    if let editableModel = model as? EditableModel {
      return editableModel.isEditable
    }
    return false
  }
  
  public func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    if (editingStyle == UITableViewCell.EditingStyle.delete) {
      let model = sections[indexPath.section].models[indexPath.row]
      editableDataSourceDelegate?.deleteModel(model)
    }
  }
  
  public func tableView(_ tableView: UITableView,
                        trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
    if let actionModel = sections[indexPath.section].models[indexPath.row] as? SwipeActionsModel,
       let actions = actionModel.swipeActions {
      let configuration = UISwipeActionsConfiguration(actions: actions)
      configuration.performsFirstActionWithFullSwipe = true
      return configuration
    }
    return nil
  }
}

// MARK: - Private
private extension TableView {
  
  // MARK: - Views registration
  func register(sections: [TableSectionModel]) {
    sections.forEach { section in
      if let viewType = section.header?.viewType,
         !registeredHeaderFooterIdentifiers.contains(viewType.reuseId) {
        register(viewType, forHeaderFooterViewReuseIdentifier: viewType.reuseId)
      }
      if let viewType = section.footer?.viewType,
         !registeredHeaderFooterIdentifiers.contains(viewType.reuseId) {
        register(viewType, forHeaderFooterViewReuseIdentifier: viewType.reuseId)
      }
    }
  }
  
  func register(models: [TableCellModel]) {
    models.forEach({ model in
      guard !registeredIdentifiers.contains(model.cellType.reuseId) else { return }
      register(model.cellType, forCellReuseIdentifier: model.cellType.reuseId)
      registeredIdentifiers.insert(model.cellType.reuseId)
    })
  }
}
