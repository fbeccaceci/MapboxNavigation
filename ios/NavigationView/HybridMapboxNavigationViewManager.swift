//
//  HybridMapboxNavigationViewManager.swift
//  MapboxNavigation
//
//  Created by Fabrizio Beccaceci on 17/10/24.
//

import Foundation
import NitroModules

class MapboxNavigationContentRegistry: NSObject {
  
  static var globalViewsMap = NSMapTable<NSNumber, MapboxNavigationViewContent>.strongToWeakObjects()
  
}

class HybridMapboxNavigationViewManager: NitroViewManager<MapboxNavigationViewContent>, HybridMapboxNavigationViewManagerSpec {
  
  init(withNitroId viewNitroId: Double) {
    super.init(viewNitroId: viewNitroId) { nitroId in
      MapboxNavigationContentRegistry.globalViewsMap.object(forKey: nitroId)
    }
  }
  
  var hybridContext = margelo.nitro.HybridContext()
  
  var memorySize: Int {
    return getSizeOf(self)
  }
  
//  func randomTestFunction() throws -> NitroModules.Promise<Void> {
//    let promise = Promise<Void>()
//    
//    DispatchQueue.main.async {
//      self.view.randomTestFunction { _ in
//        promise.resolve(withResult: ())
//      }
//    }
//    
//    return promise
//  }
  
}
