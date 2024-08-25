//
//  Extension+UIView.swift
//  SamsungCard
//
//  Created by 한세미 on 8/24/24.
//

import Foundation
import UIKit

extension UIView {
    
    @IBInspectable var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }
}
