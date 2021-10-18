//
//  extensionString.swift
//  INTEvents LAB Solution
//
//  Created by Tyler Nguyen on 2021-10-17.
//

import Foundation

extension String {
    func isValidEmail () -> Bool {
        do {
            let regex = try NSRegularExpression (pattern: "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$", options: .caseInsensitive)
            
            return regex.firstMatch(in: self, options: [], range: <#T##NSRange#>(location: 0, length: count)) != nil
            
        } catch {
        }
        return false
    }
}
