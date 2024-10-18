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
    
#if RCT_NEW_ARCH_ENABLED
    print("New arch flag reached swift")
#else
    print("New arch flag did not reach swift")
#endif
    
    return a + b
  }
}
