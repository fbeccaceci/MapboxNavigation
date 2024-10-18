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

@objc public class MapboxNavigationViewContent: UIView {

  private let navigationMapView = NavigationMapView(location: PassthroughSubject().eraseToAnyPublisher(),
                                                    routeProgress: PassthroughSubject().eraseToAnyPublisher())

  public override init(frame: CGRect) {
    super.init(frame: frame)
    
    print("Swift Running on: \(Thread.isMainThread ? "Main Thread" : "Background Thread")")
  
    setupNavigationMapView()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setupNavigationMapView() {
    navigationMapView.translatesAutoresizingMaskIntoConstraints = false
    
    self.addSubview(navigationMapView)
    
    NSLayoutConstraint.activate([
      navigationMapView.topAnchor.constraint(equalTo: self.topAnchor),
      navigationMapView.rightAnchor.constraint(equalTo: self.rightAnchor),
      navigationMapView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
      navigationMapView.leftAnchor.constraint(equalTo: self.leftAnchor)
    ])
  }
  
  public func randomTestFunction(completion: AnimationCompletion?) {    
    let camera = self.navigationMapView.mapView.camera
    
    let cameraOptions = CameraOptions(center: .init(latitude: 10, longitude: 10))
    
    camera?.ease(to: cameraOptions, duration: 1, completion: completion)
  }
  
  public func testSetBackgroundColor() {
    self.backgroundColor = .blue
  }

}
