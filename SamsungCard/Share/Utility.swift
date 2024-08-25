//
//  Utility.swift
//  SamsungCard
//
//  Created by 한세미 on 8/23/24.
//

import Foundation

final class Utility {
    
    class func print<LOG> (_ log: LOG, function: String = #function, line: Int = #line, _ isDebug: Bool = false) {
        #if DEBUG
            let currentDateString = Date().toString(format: "yyyy-MM-dd HH:mm:ss.SSSS")
            Swift.print("🛠️ \(currentDateString) (\(function):\(line)) 🛠️:\n\(log)\n")
        #endif
    }

}
