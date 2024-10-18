//
//  NitroViewManager.swift
//  boost-boost_privacy
//
//  Created by Fabrizio Beccaceci on 18/10/24.
//

import Foundation

class NitroViewManager<TView> {
  
  private let viewNitroId: Double
  private let viewInitializer: (NSNumber) -> TView?
  
  init(viewNitroId: Double, viewInitializer: @escaping (NSNumber) -> TView?) {
    self.viewNitroId = viewNitroId
    self.viewInitializer = viewInitializer
  }
  
  lazy var view: TView = {
    let view = self.viewInitializer(NSNumber(value: self.viewNitroId))
    
    guard let view = view else {
      fatalError("NitroViewManager view was not found in global map")
    }
    
    return view
  }()
  
}
