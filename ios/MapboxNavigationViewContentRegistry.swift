//
//  MapboxNavigationViewContentRegistry.swift
//  MapboxNavigation
//
//  Created by Fabrizio Beccaceci on 17/10/24.
//

import Foundation

@objc public class MapboxNavigationContentRegistry: NSObject {
  
  @objc public static var globalViewsMap = NSMapTable<NSNumber, MapboxNavigationViewContent>.strongToWeakObjects()
  
}
