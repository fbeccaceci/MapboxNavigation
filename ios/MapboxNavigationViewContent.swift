//
//  MapboxNavigationViewContent.swift
//  MapboxNavigation
//
//  Created by Fabrizio Beccaceci on 16/10/24.
//

import UIKit

@objc public class MapboxNavigationViewContent: UIView {

  override init(frame: CGRect) {
    super.init(frame: frame)
    
    self.backgroundColor = .red
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
