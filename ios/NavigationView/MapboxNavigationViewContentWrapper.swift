//
//  MapboxNavigationViewContentWrapper.swift
//  MapboxNavigation
//
//  Created by Fabrizio Beccaceci on 20/10/24.
//

import Foundation

@objc public class MapboxNavigationViewContentWrapper: UIView {
  
  private let subView = MapboxNavigationViewContent()
  
  public override init(frame: CGRect) {
    super.init(frame: frame)
    
    self.addSubview(subView)
    
    subView.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      subView.topAnchor.constraint(equalTo: self.topAnchor),
      subView.rightAnchor.constraint(equalTo: self.rightAnchor),
      subView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
      subView.leftAnchor.constraint(equalTo: self.leftAnchor)
    ])
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  @objc public func setNitroId(_ nitroId: NSNumber) {
    MapboxNavigationContentRegistry.globalViewsMap.setObject(subView, forKey: nitroId)
  }
  
}
