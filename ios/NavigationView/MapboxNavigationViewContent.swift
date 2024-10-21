//
//  MapboxNavigationViewContent.swift
//  MapboxNavigation
//
//  Created by Fabrizio Beccaceci on 15/10/24.
//

import UIKit
import MapboxNavigationCore
import MapboxMaps
import Combine
import CoreLocation

class MapboxNavigationViewContent: UIView {
  
  private let navigationMapView = NavigationMapView(location: PassthroughSubject().eraseToAnyPublisher(),
                                                    routeProgress: PassthroughSubject().eraseToAnyPublisher())
  
  private let locationProvider = {
    let provider = EmptyUntilLocationPermissionGrantedLocationProvider()
    provider.configurer = { p in
      p.options.activityType = .automotiveNavigation
    }
  
    return provider
  }()

  public override init(frame: CGRect) {
    super.init(frame: frame)
  
    setupNavigationMapView()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setupNavigationMapView() {
    navigationMapView.translatesAutoresizingMaskIntoConstraints = false
    
    navigationMapView.mapView.location.override(provider: locationProvider)
    
    self.addSubview(navigationMapView)
    
    NSLayoutConstraint.activate([
      navigationMapView.topAnchor.constraint(equalTo: self.topAnchor),
      navigationMapView.rightAnchor.constraint(equalTo: self.rightAnchor),
      navigationMapView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
      navigationMapView.leftAnchor.constraint(equalTo: self.leftAnchor)
    ])
  }
  
  func randomTestFunction(completion: AnimationCompletion?) {
    let camera = self.navigationMapView.mapView.camera
    
    let cameraOptions = CameraOptions(center: .init(latitude: 10, longitude: 10))
    
    camera?.ease(to: cameraOptions, duration: 1, completion: completion)
  }
  
  func testSetBackgroundColor() {
    self.backgroundColor = .blue
  }
  
}

