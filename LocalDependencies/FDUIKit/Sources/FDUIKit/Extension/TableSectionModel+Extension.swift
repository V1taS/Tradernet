//
//  TableSectionModel+Extension.swift
//  FDUIKit
//
//  Created by Vitalii Sosin on 01.10.2024.
//

import Foundation

extension Array where Element == TableSectionModel {
  
  ///  Рассчитывает IndexPath конкретной модели(сравнивает указатели)
  ///  Сложность O(n^2)
  /// - Parameter model: модель для которой будет найден IndexPath
  /// - Returns: IndexPath для первой совпавшей модели
  public func firstIndexPath(ofModel model: TableCellModel) -> IndexPath? {
    for (sectionIndex, section) in enumerated() {
      for (modelIndex, currentModel) in section.models.enumerated() {
        if (currentModel as AnyObject) === (model as AnyObject) {
          return IndexPath(row: modelIndex, section: sectionIndex)
        }
      }
    }
    return nil
  }
}
