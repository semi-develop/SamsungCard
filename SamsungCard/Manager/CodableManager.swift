//
//  CodableManager.swift
//  SamsungCard
//
//  Created by 한세미 on 8/23/24.
//

import Foundation

class CodableManager {
    
    class func decode <T: Decodable> (type: T.Type, _ data: Data?) -> T? {
        guard let data = data else {
            Utility.print("No data to decode")
            return nil
        }
        
        let decoder = JSONDecoder()
        
        guard let decodeData = try? decoder.decode(T.self, from: data) else {
            Utility.print("Fail to decode as \(type)")
            return nil
        }
        
        return decodeData
        
    }
    
    class func decodeArray <T: Decodable> (type: T.Type, _ data: Data?) -> [T]? {
        guard let data = data else {
            Utility.print("No data to decode")
            return nil
        }
        
        let decoder = JSONDecoder()
        
        guard let decodeData = try? decoder.decode([T].self, from: data) else {
            Utility.print("Fail to decode as [\(type)]")
            return nil
        }
        
        return decodeData
        
    }
    
}
