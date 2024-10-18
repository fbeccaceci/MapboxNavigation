///
/// HybridNitroMapboxNavigationViewManagerRegistrySpecCxx.swift
/// This file was generated by nitrogen. DO NOT MODIFY THIS FILE.
/// https://github.com/mrousavy/nitro
/// Copyright © 2024 Marc Rousavy @ Margelo
///

import Foundation
import NitroModules

/**
 * A class implementation that bridges HybridNitroMapboxNavigationViewManagerRegistrySpec over to C++.
 * In C++, we cannot use Swift protocols - so we need to wrap it in a class to make it strongly defined.
 *
 * Also, some Swift types need to be bridged with special handling:
 * - Enums need to be wrapped in Structs, otherwise they cannot be accessed bi-directionally (Swift bug: https://github.com/swiftlang/swift/issues/75330)
 * - Other HybridObjects need to be wrapped/unwrapped from the Swift TCxx wrapper
 * - Throwing methods need to be wrapped with a Result<T, Error> type, as exceptions cannot be propagated to C++
 */
public class HybridNitroMapboxNavigationViewManagerRegistrySpecCxx {
  /**
   * The Swift <> C++ bridge's namespace (`margelo::nitro::iplastudio::mapboxnavigation::bridge::swift`)
   * from `MapboxNavigation-Swift-Cxx-Bridge.hpp`.
   * This contains specialized C++ templates, and C++ helper functions that can be accessed from Swift.
   */
  public typealias bridge = margelo.nitro.iplastudio.mapboxnavigation.bridge.swift

  /**
   * Holds an instance of the `HybridNitroMapboxNavigationViewManagerRegistrySpec` Swift protocol.
   */
  private var implementation: HybridNitroMapboxNavigationViewManagerRegistrySpec

  /**
   * Get the actual `HybridNitroMapboxNavigationViewManagerRegistrySpec` instance this class wraps.
   */
  @inline(__always)
  public func getHybridNitroMapboxNavigationViewManagerRegistrySpec() -> HybridNitroMapboxNavigationViewManagerRegistrySpec {
    return implementation
  }

  /**
   * Create a new `HybridNitroMapboxNavigationViewManagerRegistrySpecCxx` that wraps the given `HybridNitroMapboxNavigationViewManagerRegistrySpec`.
   * All properties and methods bridge to C++ types.
   */
  public init(_ implementation: HybridNitroMapboxNavigationViewManagerRegistrySpec) {
    self.implementation = implementation
    /* no base class */
  }

  /**
   * Contains a (weak) reference to the C++ HybridObject to cache it.
   */
  public var hybridContext: margelo.nitro.HybridContext {
    @inline(__always)
    get {
      return self.implementation.hybridContext
    }
    @inline(__always)
    set {
      self.implementation.hybridContext = newValue
    }
  }

  /**
   * Get the memory size of the Swift class (plus size of any other allocations)
   * so the JS VM can properly track it and garbage-collect the JS object if needed.
   */
  @inline(__always)
  public var memorySize: Int {
    return self.implementation.memorySize
  }

  // Properties
  

  // Methods
  @inline(__always)
  public func createViewManager(nitroId: Double) -> HybridMapboxNavigationViewManagerSpecCxx {
    do {
      let result = try self.implementation.createViewManager(nitroId: nitroId)
      return result.createCxxBridge()
    } catch {
      let message = "\(error.localizedDescription)"
      fatalError("Swift errors can currently not be propagated to C++! See https://github.com/swiftlang/swift/issues/75290 (Error: \(message))")
    }
  }
}