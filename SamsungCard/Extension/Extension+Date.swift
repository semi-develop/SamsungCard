//
//  Extension+String.swift
//  SamsungCard
//
//  Created by 한세미 on 8/23/24.
//

import Foundation

extension Date {
    
    func toString(format: String)-> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.current
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
    
    func dateToString(dateFormat: String = "yyyy.M.dd a hh:mm:ss") -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        return dateFormatter.string(from: self)
    }
    
}
