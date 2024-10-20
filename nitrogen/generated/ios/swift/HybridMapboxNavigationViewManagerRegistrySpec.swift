///
/// HybridMapboxNavigationViewManagerRegistrySpec.swift
/// This file was generated by nitrogen. DO NOT MODIFY THIS FILE.
/// https://github.com/mrousavy/nitro
/// Copyright © 2024 Marc Rousavy @ Margelo
///

import Foundation
import NitroModules

/**
 * A Swift protocol representing the MapboxNavigationViewManagerRegistry HybridObject.
 * Implement this protocol to create Swift-based instances of MapboxNavigationViewManagerRegistry.
 *
 * When implementing this protocol, make sure to initialize `hybridContext` - example:
 * ```
 * public class HybridMapboxNavigationViewManagerRegistry : HybridMapboxNavigationViewManagerRegistrySpec {
 *   // Initialize HybridContext
 *   var hybridContext = margelo.nitro.HybridContext()
 *
 *   // Return size of the instance to inform JS GC about memory pressure
 *   var memorySize: Int {
 *     return getSizeOf(self)
 *   }
 *
 *   // ...
 * }
 * ```
 */
public protocol HybridMapboxNavigationViewManagerRegistrySpec: AnyObject, HybridObjectSpec {
  // Properties
  

  // Methods
  func createViewManager(nitroId: Double) throws -> HybridMapboxNavigationViewManagerSpec
}

public extension HybridMapboxNavigationViewManagerRegistrySpec {
  /**
   * Create a new instance of HybridMapboxNavigationViewManagerRegistrySpecCxx for the given HybridMapboxNavigationViewManagerRegistrySpec.
   *
   * Instances of HybridMapboxNavigationViewManagerRegistrySpecCxx can be accessed from C++, and contain
   * additional required bridging code for C++ <> Swift interop.
   */
  func createCxxBridge() -> HybridMapboxNavigationViewManagerRegistrySpecCxx {
    return HybridMapboxNavigationViewManagerRegistrySpecCxx(self)
  }
}