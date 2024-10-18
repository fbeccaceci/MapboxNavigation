//
//  HybridNitroMapboxNavigationViewManagerRegistry.swift
//  MapboxNavigation
//
//  Created by Fabrizio Beccaceci on 17/10/24.
//

import Foundation
import NitroModules


public class HybridMapboxNavigationViewManagerRegistry: HybridMapboxNavigationViewManagerRegistrySpec {
    
  public var hybridContext = margelo.nitro.HybridContext()
  
  public var memorySize: Int {
    return getSizeOf(self)
  }
  
  public func createViewManager(nitroId: Double) throws -> any HybridMapboxNavigationViewManagerSpec {
    print("getting view from map")
  
    return HybridMapboxNavigationViewManager(withNitroId: nitroId)
  }
  
}
