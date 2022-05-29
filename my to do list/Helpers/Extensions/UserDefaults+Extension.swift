//
//  UserDefaults+Extension.swift
//  my to do list
//
//  Created by Mahbubur Rashid Leon on 29/5/22.
//

import Foundation

extension UserDefaults {
    func hasData(forKey keyName: UserDefaultsKeys) -> Bool {
        return object(forKey: keyName.rawValue) != nil
    }
    
    func setData(_ value: Data?, forKey keyName: UserDefaultsKeys) {
        setValue(value, forKey: keyName.rawValue)
    }
    
    func getData<T: Codable>(forKey keyName: UserDefaultsKeys, model: T.Type) -> [T]? {
        guard let data  = object(forKey: keyName.rawValue) as? Data else {
            return nil
        }
        return try? JSONDecoder().decode([T].self, from: data)
    }
}
