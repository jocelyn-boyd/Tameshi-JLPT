//
//  Utilities.swift
//  tameshi-jlpt
//
//  Created by Jocelyn Boyd on 2/7/20.
//  Copyright © 2020 Jocelyn Boyd. All rights reserved.
//

import Foundation
import UIKit

class Utilities {
  
  static func setViewBackgroundColor(_ view: UIView) {
    view.backgroundColor = .systemBackground
}
  
  static func setHeaderLabel(_ label: UILabel) {
    label.numberOfLines = 0
    
    label.translatesAutoresizingMaskIntoConstraints = false
  }
  
  static func setQuestionLabel(_ label: UILabel) {
     label.numberOfLines = 1
     label.lineBreakMode = .byWordWrapping
     label.allowsDefaultTighteningForTruncation = true
     label.textAlignment = .natural
     
     label.translatesAutoresizingMaskIntoConstraints = false
   }
  
  
  static func setButton(_ button: UIButton) {
    button.setTitleColor(.black, for: .normal)
    
    button.layer.cornerRadius = 5
    button.layer.borderColor = UIColor.black.cgColor
    button.layer.borderWidth = 2
    
    button.translatesAutoresizingMaskIntoConstraints = false
  }
}
