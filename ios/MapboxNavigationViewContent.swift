//
//  MapboxNavigationViewContent.swift
//  MapboxNavigation
//
//  Created by Fabrizio Beccaceci on 15/10/24.
//

import UIKit
import MapboxNavigationCore
import Combine

@objc public class MapboxNavigationViewContent: UIView {

  private let navigationMapView = NavigationMapView(location: PassthroughSubject().eraseToAnyPublisher(),
                                                    routeProgress: PassthroughSubject().eraseToAnyPublisher())

  public override init(frame: CGRect) {
    super.init(frame: frame)
  
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

}
