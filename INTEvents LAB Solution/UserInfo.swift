//
//  UserInfo.swift
//  INTEvents LAB Solution
//
//  Created by Tyler Nguyen on 2021-10-17.
//

import Foundation
class USerInfo {
    static func setUsername( username : String ) {
        UserDefaults.standard.removeObject(forKey: "username")
    }
    
    static func clearUsername() {
        UserDefaults.standard.removeObject(forKey: "username")
    }
    
    static func getUsername() -> String {
        let username = UserDefaults.standard.string(forKey: "username") ?? ""
        return username
    }
}
