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

@objc public protocol MapboxNavigationViewContentDelegate {
  func mapboxNavigationViewContent(_ mapboxNavigationView: MapboxNavigationViewContent, didUpdateNavigationCameraState navigationCameraState: String)
}

@objc public class MapboxNavigationViewContent: UIView {
  
  @objc public var delegate: MapboxNavigationViewContentDelegate?
  
  private let navigationMapView = NavigationMapView(location: PassthroughSubject().eraseToAnyPublisher(),
                                                    routeProgress: PassthroughSubject().eraseToAnyPublisher())
  
  private let locationProvider = {
    let provider = EmptyUntilLocationPermissionGrantedLocationProvider()
    provider.configurer = { p in
      p.options.activityType = .automotiveNavigation
    }
  
    return provider
  }()
  
  private var cancellables = Set<AnyCancelable>()

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
    
    navigationMapView.mapView.mapboxMap.onCameraChanged.observe { [weak self] event in
      guard let self = self else { return }
      
      self.delegate?.mapboxNavigationViewContent(self, didUpdateNavigationCameraState: "Hello event emitter")
    }.store(in: &cancellables)
  }
  
  @objc public func setNitroId(_ nitroId: NSNumber) {
    MapboxNavigationContentRegistry.globalViewsMap.setObject(self, forKey: nitroId)
  }
  
  @objc public func setStyleUrl(_ styleUrl: String) {
    self.navigationMapView.mapView.mapboxMap.styleURI = StyleURI(rawValue: styleUrl)
  }
  
  @objc public func setPuckType(_ type: String) {
    switch type {
    case "3d":
      self.navigationMapView.puckType = .puck3D(.navigationDefault)
    case "2d":
      self.navigationMapView.puckType = .puck2D(.makeDefault(showBearing: true))
      break
    case "none":
      self.navigationMapView.puckType = .none
    default:
      break
    }
  }
  
  @objc public func setViewportPadding(_ viewportPadding: UIEdgeInsets) {
    self.navigationMapView.viewportPadding = viewportPadding
  }
  
  @objc public func setLogoMargin(_ logoMargin: CGPoint) {
    self.navigationMapView.mapView.ornaments.options.logo.margins = logoMargin
  }
  
}

