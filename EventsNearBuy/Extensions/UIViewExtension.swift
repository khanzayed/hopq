//
//  File.swift
//  EventsNearBuy
//
//  Created by Faraz Habib on 15/07/18.
//  Copyright © 2018 Faraz Habib. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    public func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        let maskPath = UIBezierPath(roundedRect: self.bounds,
                                    byRoundingCorners: corners,
                                    cornerRadii: CGSize(width: radius, height: radius))
        let shape = CAShapeLayer()
        shape.path = maskPath.cgPath
        layer.mask = shape
        
        self.layer.masksToBounds = true
    }
    
    public func roundCorners(_ radius: CGFloat) {
        let maskPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: radius)
        
        let shape = CAShapeLayer()
        shape.path = maskPath.cgPath
        layer.mask = shape
        
        self.layer.masksToBounds = true
    }
    
}
