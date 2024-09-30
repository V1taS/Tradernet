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
public enum FDStyleAsset {
  public static let constantAmberGlow = FDStyleColors(name: "constantAmberGlow")
  public static let constantAzure = FDStyleColors(name: "constantAzure")
  public static let constantGhost = FDStyleColors(name: "constantGhost")
  public static let constantLime = FDStyleColors(name: "constantLime")
  public static let constantNavy = FDStyleColors(name: "constantNavy")
  public static let constantOnyx = FDStyleColors(name: "constantOnyx")
  public static let constantRuby = FDStyleColors(name: "constantRuby")
  public static let constantSlate = FDStyleColors(name: "constantSlate")
  public static let constantSearchCurrency = FDStyleColors(name: "constantSearchCurrency")
  public static let constantLightMistGray = FDStyleColors(name: "constantLightMistGray")
  public static let ghost = FDStyleColors(name: "ghost")
  public static let navy = FDStyleColors(name: "navy")
  public static let onyx = FDStyleColors(name: "onyx")
}
// swiftlint:enable identifier_name line_length nesting type_body_length type_name

// MARK: - Implementation Details

public final class FDStyleColors {
  public fileprivate(set) var name: String
  
#if os(macOS)
  public typealias Color = NSColor
#elseif os(iOS) || os(tvOS) || os(watchOS)
  public typealias Color = UIColor
#endif
  
  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  public private(set) lazy var color: Color = {
    guard let color = Color(asset: self) else {
      fatalError("Unable to load color asset named \(name).")
    }
    return color
  }()
  
#if canImport(SwiftUI)
  private var _swiftUIColor: Any? = nil
  @available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
  public private(set) var swiftUIColor: SwiftUI.Color {
    get {
      if self._swiftUIColor == nil {
        self._swiftUIColor = SwiftUI.Color(asset: self)
      }
      
      return self._swiftUIColor as! SwiftUI.Color
    }
    set {
      self._swiftUIColor = newValue
    }
  }
#endif
  
  fileprivate init(name: String) {
    self.name = name
  }
}

public extension FDStyleColors.Color {
  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  convenience init?(asset: FDStyleColors) {
    let bundle = FDStyleResources.bundle
#if os(iOS) || os(tvOS)
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
#elseif os(macOS)
    self.init(named: NSColor.Name(asset.name), bundle: bundle)
#elseif os(watchOS)
    self.init(named: asset.name)
#endif
  }
}

#if canImport(SwiftUI)
@available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
public extension SwiftUI.Color {
  init(asset: FDStyleColors) {
    let bundle = FDStyleResources.bundle
    self.init(asset.name, bundle: bundle)
  }
}
#endif

public struct FDStyleAssetData {
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
  convenience init?(asset: FDStyleAssetData) {
    let bundle = FDStyleResources.bundle
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
