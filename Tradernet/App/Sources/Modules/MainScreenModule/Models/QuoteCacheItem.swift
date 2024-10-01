//
//  QuoteCacheItem.swift
//  Tradernet
//
//  Created by Vitalii Sosin on 01.10.2024.
//  Copyright © 2024 SosinVitalii.com. All rights reserved.
//

import Foundation
import FDAbstractions
import FDUIKit

final class QuoteCacheItem {
  var quoteData: QuoteData
  var model: QuoteCard.Model
  var timer: Timer?
  
  init(quoteData: QuoteData, model: QuoteCard.Model) {
    self.quoteData = quoteData
    self.model = model
  }
}
