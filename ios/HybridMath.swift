//
//  HybridMath.swift
//  react-native-mapbox-navigation
//
//  Created by Fabrizio Beccaceci on 15/10/24.
//

import UIKit
import NitroModules


class HybridMath : HybridMathSpec {
    
  public var hybridContext = margelo.nitro.HybridContext()
  
  public var memorySize: Int {
    return getSizeOf(self)
  }

  public var pi: Double {
    return Double.pi
  }
  public func add(a: Double, b: Double) throws -> Double {
    return a + b
  }
}
