//
//  ImageEditingModel.swift
//  Strats360_Kids
//
//  Created by Strats 360 on 26/12/22.
//

import Foundation
import UIKit

//MARK: Custom Button Code
class CustomButton{
    
    func editbtn1(pressButton: UIButton){
        pressButton.layer.shadowColor = UIColor.black.cgColor
        pressButton.layer.shadowOffset = CGSize(width: 0.0, height: 5.0)
        pressButton.layer.masksToBounds = false
        pressButton.layer.shadowRadius = 2.0
        pressButton.layer.shadowOpacity = 0.5
        pressButton.layer.cornerRadius = 10
        pressButton.layer.borderColor = UIColor.black.cgColor
        pressButton.layer.borderWidth = 2.0
    }
    
}

//MARK: Custom UISlider

class CustomSlider: UISlider {
  @IBInspectable var trackHeight: CGFloat = 20
  override func trackRect(forBounds bounds: CGRect) -> CGRect {
    return CGRect(origin: bounds.origin, size: CGSize(width: bounds.width, height: trackHeight))
      
  }
}

//MARK: Custom Progress Bar.

class BigProgressView: UIProgressView {
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        return CGSize(width: size.width, height: 15)
    }
}

//MARK:

//MARK:

//MARK:

//MARK: 
