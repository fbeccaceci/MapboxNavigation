//
//  HybridMapboxNavigationViewManager.swift
//  MapboxNavigation
//
//  Created by Fabrizio Beccaceci on 17/10/24.
//

import Foundation
import NitroModules

class HybridMapboxNavigationViewManager: HybridMapboxNavigationViewManagerSpec {
  
  private let viewNitroId: Double
  
  private lazy var view: MapboxNavigationViewContent = {
    let view = MapboxNavigationContentRegistry.globalViewsMap.object(forKey: NSNumber(value: self.viewNitroId))
    
    guard let view = view else {
      fatalError("NitroViewManager view was not found in global map")
    }
    
    return view
  }()

  init(withNitroId viewNitroId: Double) {
    self.viewNitroId = viewNitroId
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
