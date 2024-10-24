///
/// HybridMapboxNavigationViewManagerSpec.swift
/// This file was generated by nitrogen. DO NOT MODIFY THIS FILE.
/// https://github.com/mrousavy/nitro
/// Copyright © 2024 Marc Rousavy @ Margelo
///

import Foundation
import NitroModules

/**
 * A Swift protocol representing the MapboxNavigationViewManager HybridObject.
 * Implement this protocol to create Swift-based instances of MapboxNavigationViewManager.
 *
 * When implementing this protocol, make sure to initialize `hybridContext` - example:
 * ```
 * public class HybridMapboxNavigationViewManager : HybridMapboxNavigationViewManagerSpec {
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
public protocol HybridMapboxNavigationViewManagerSpec: AnyObject, HybridObjectSpec {
  // Properties
  

  // Methods
  
}

public extension HybridMapboxNavigationViewManagerSpec {
  /**
   * Create a new instance of HybridMapboxNavigationViewManagerSpecCxx for the given HybridMapboxNavigationViewManagerSpec.
   *
   * Instances of HybridMapboxNavigationViewManagerSpecCxx can be accessed from C++, and contain
   * additional required bridging code for C++ <> Swift interop.
   */
  func createCxxBridge() -> HybridMapboxNavigationViewManagerSpecCxx {
    return HybridMapboxNavigationViewManagerSpecCxx(self)
  }
}
