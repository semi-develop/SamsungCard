//
//  Extension+String.swift
//  SamsungCard
//
//  Created by 한세미 on 8/23/24.
//

import Foundation
import UIKit
import FLAnimatedImage

extension String {
    
    func loadImage() async -> UIImage? {
        guard let url = URL(string: self),
              let (data, _) = try? await URLSession.shared.data(from: url),
              let image = UIImage(data: data) else {
            return nil
        }
        return image
    }
    
    func loadGif() async -> FLAnimatedImage? {
        guard let url = URL(string: self),
              let (data, _) = try? await URLSession.shared.data(from: url),
              let gif = FLAnimatedImage(animatedGIFData: data) else {
            return nil
        }
        return gif
    }
    
    
    
}
