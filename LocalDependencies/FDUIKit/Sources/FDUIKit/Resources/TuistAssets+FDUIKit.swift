//
//  TuistAssets+FDUIKit.swift
//  FDUIKit
//
//  Created by Vitalii Sosin on 01.10.2024.
//

// swiftlint:disable all
// swift-format-ignore-file
// swiftformat:disable all
// Generated using tuist — https://github.com/tuist/tuist

#if os(macOS)
import AppKit
#elseif os(iOS)
import UIKit
#elseif os(tvOS) || os(watchOS)
import UIKit
#endif
#if canImport(SwiftUI)
import SwiftUI
#endif

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Asset Catalogs

// swiftlint:disable identifier_name line_length nesting type_body_length type_name
public enum FDUIKitAsset {
  public static let chevronRight = FDUIKitAssetData(name: "chevron-right")
}
// swiftlint:enable identifier_name line_length nesting type_body_length type_name

// MARK: - Implementation Details

public struct FDUIKitAssetData {
  public fileprivate(set) var name: String
  
#if os(iOS) || os(tvOS) || os(macOS)
  @available(iOS 9.0, macOS 10.11, *)
  public var data: NSDataAsset {
    guard let data = NSDataAsset(asset: self) else {
      fatalError("Unable to load data asset named \(name).")
    }
    return data
  }
#endif
}

#if os(iOS) || os(tvOS) || os(macOS)
@available(iOS 9.0, macOS 10.11, *)
public extension NSDataAsset {
  convenience init?(asset: FDUIKitAssetData) {
    let bundle = FDUIKitResources.bundle
#if os(iOS) || os(tvOS)
    self.init(name: asset.name, bundle: bundle)
#elseif os(macOS)
    self.init(name: NSDataAsset.Name(asset.name), bundle: bundle)
#endif
  }
}
#endif


// swiftlint:enable all
// swiftformat:enable all
