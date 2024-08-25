//
//  Extension+ViewController.swift
//  SamsungCard
//
//  Created by 한세미 on 8/25/24.
//

import UIKit

extension UIApplication {
    var currentWindow: UIWindow? {
        return self.connectedScenes
            .filter { $0.activationState == .foregroundActive }
            .compactMap { $0 as? UIWindowScene }
            .first?.windows
            .filter { $0.isKeyWindow }.first
    }
}
