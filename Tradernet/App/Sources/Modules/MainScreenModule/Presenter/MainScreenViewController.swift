//
//  MainScreenViewController.swift
//  Tradernet
//
//  Created by Vitalii Sosin on 30.09.2024.
//

import UIKit
import FDAbstractions
import FDUIKit

/// Презентер
final class MainScreenViewController: MainScreenModule {
  
  // MARK: - Internal properties
  
  weak var moduleOutput: MainScreenModuleOutput?
  
  // MARK: - Private properties
  
  private let interactor: MainScreenInteractorInput
  private let factory: MainScreenFactoryInput
  
  // MARK: - Initialization
  
  /// - Parameters:
  ///   - interactor: интерактор
  ///   - factory: фабрика
  init(interactor: MainScreenInteractorInput,
       factory: MainScreenFactoryInput) {
    self.interactor = interactor
    self.factory = factory
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - Life cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    moduleView.showLoaderView(true)
    interactor.start()
    setupNavigation()
  }
}

// MARK: - MainScreenInteractorOutput

extension MainScreenViewController: MainScreenInteractorOutput {
  func didReceiveQuoteData(_ quoteData: QuoteData) {
    moduleView.showLoaderView(false)
    factory.createInitialElements(quoteData)
  }
  
  func didReceiveError(_ error: Error) {
    interactor.showNotification(.negative(title: error.localizedDescription))
  }
}

// MARK: - MainScreenFactoryOutput

extension MainScreenViewController: MainScreenFactoryOutput {
  func didAddModels(_ models: [TableSectionModel]) {
    moduleView.configure(models: models)
  }
  
  func didUpdateModels(_ models: [TableSectionModel], updateModel: TableCellModel) {
    guard let indexPath = models.firstIndexPath(ofModel: updateModel) else {
      return
    }
    moduleView.reloadRows(at: [indexPath], with: .none, dataSource: models)
  }
}

// MARK: - Private

private extension MainScreenViewController {
  func setupNavigation() {
    navigationItem.title = Appearance().title
    navigationItem.largeTitleDisplayMode = .always
  }
}

// MARK: - Appearance

private extension MainScreenViewController {
  struct Appearance {
    let title = "Tradernet"
  }
}
