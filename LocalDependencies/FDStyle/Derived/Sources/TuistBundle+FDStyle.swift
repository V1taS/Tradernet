// swiftlint:disable all
// swift-format-ignore-file
// swiftformat:disable all
import Foundation

// MARK: - Swift Bundle Accessor

private class BundleFinder {}

extension Foundation.Bundle {
/// Since FDStyle is a staticFramework, the bundle containing the resources is copied into the final product.
static let module: Bundle = {
    let bundleName = "FDStyle_FDStyle"

    let candidates = [
        Bundle.main.resourceURL,
        Bundle(for: BundleFinder.self).resourceURL,
        Bundle.main.bundleURL,
    ]

    for candidate in candidates {
        let bundlePath = candidate?.appendingPathComponent(bundleName + ".bundle")
        if let bundle = bundlePath.flatMap(Bundle.init(url:)) {
            return bundle
        }
    }
    fatalError("unable to find bundle named FDStyle_FDStyle")
}()
}

// MARK: - Objective-C Bundle Accessor

@objc
public class FDStyleResources: NSObject {
@objc public class var bundle: Bundle {
    return .module
}
}
// swiftlint:enable all
// swiftformat:enable all
