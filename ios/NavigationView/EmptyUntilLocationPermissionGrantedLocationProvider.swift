//
//  EmptyUntilLocationPermissionGrantedLocationProvider.swift
//  ExpoMapboxNavigation
//
//  Created by Fabrizio Beccaceci on 04/09/24.
//

import UIKit
import Foundation
import MapboxCommon
import MapboxMaps
import CoreLocation

class EmptyUntilLocationPermissionGrantedLocationProvider: NSObject {
  
  public var configurer: ((AppleLocationProvider) -> Void)?
  
  private var appleLocationProvider: AppleLocationProvider? = nil
  
  private var pendingLocationObservers: [any LocationObserver] = []
  private var pendingHeadingObservers: [any MapboxMaps.HeadingObserver] = []
  
  private var locationManager = CLLocationManager()
  
  override init() {
    super.init()
    
    self.locationManager.delegate = self
  }
  
  private func setPermissionsGranted() {
    // Means we are already initialized, setPermissionsGranted was called more than one time
    if self.appleLocationProvider != nil { return }
    
    self.appleLocationProvider = AppleLocationProvider()
    self.configurer?(self.appleLocationProvider!)
    
    self.pendingLocationObservers.forEach { appleLocationProvider!.addLocationObserver(for: $0) }
    self.pendingLocationObservers = []
    
    self.pendingHeadingObservers.forEach { appleLocationProvider!.add(headingObserver: $0) }
    self.pendingHeadingObservers = []
  }
  
}

extension EmptyUntilLocationPermissionGrantedLocationProvider: LocationProvider {
  func addLocationObserver(for observer: any LocationObserver) {
    if let appleLocationProvider = self.appleLocationProvider {
      appleLocationProvider.addLocationObserver(for: observer)
      return
    }
    
    pendingLocationObservers.append(observer)
  }
  
  func removeLocationObserver(for observer: any LocationObserver) {
    if let appleLocationProvider = self.appleLocationProvider {
      appleLocationProvider.removeLocationObserver(for: observer)
      return
    }
    
    pendingLocationObservers.removeAll { $0 === observer}
  }
  
  func getLastObservedLocation() -> Location? {
    if let appleLocationProvider = self.appleLocationProvider {
      return appleLocationProvider.getLastObservedLocation()
    }
    
    return nil
  }
}

extension EmptyUntilLocationPermissionGrantedLocationProvider: HeadingProvider {
  var latestHeading: MapboxMaps.Heading? {
    if let appleLocationProvider = self.appleLocationProvider {
      return appleLocationProvider.latestHeading
    }
    
    return nil
  }
  
  func add(headingObserver: any MapboxMaps.HeadingObserver) {
    if let appleLocationProvider = self.appleLocationProvider {
      appleLocationProvider.add(headingObserver: headingObserver)
      return
    }
    
    self.pendingHeadingObservers.append(headingObserver)
  }
  
  func remove(headingObserver: any MapboxMaps.HeadingObserver) {
    if let appleLocationProvider = self.appleLocationProvider {
      appleLocationProvider.remove(headingObserver: headingObserver)
      return
    }
    
    pendingHeadingObservers.removeAll { $0 === headingObserver }
  }
}

extension EmptyUntilLocationPermissionGrantedLocationProvider: CLLocationManagerDelegate {
  
  func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
    
    if manager.authorizationStatus == .authorizedAlways || manager.authorizationStatus == .authorizedWhenInUse {
      self.setPermissionsGranted()
    }
  }
  
}
