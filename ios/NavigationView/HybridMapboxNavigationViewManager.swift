//
//  HybridMapboxNavigationViewManager.swift
//  MapboxNavigation
//
//  Created by Fabrizio Beccaceci on 17/10/24.
//

import Foundation
import NitroModules

@objc public class MapboxNavigationContentRegistry: NSObject {
  
  @objc public static var globalViewsMap = NSMapTable<NSNumber, MapboxNavigationViewContent>.strongToWeakObjects()
  
}

class HybridMapboxNavigationViewManager: NitroViewManager<MapboxNavigationViewContent>, HybridMapboxNavigationViewManagerSpec {
  
  @objc public static var globalViewsMap = NSMapTable<NSNumber, MapboxNavigationViewContent>.strongToWeakObjects()
  
  init(withNitroId viewNitroId: Double) {
    super.init(viewNitroId: viewNitroId) { nitroId in
      MapboxNavigationContentRegistry.globalViewsMap.object(forKey: nitroId)
    }
  }
  
  public var hybridContext = margelo.nitro.HybridContext()
  
  public var memorySize: Int {
    return getSizeOf(self)
  }
  
  func randomTestFunction() throws -> NitroModules.Promise<Void> {
    let promise = Promise<Void>()
    
    DispatchQueue.main.async {
      self.view.randomTestFunction { _ in
        promise.resolve(withResult: ())
      }
    }
    
    return promise
  }
  
}
