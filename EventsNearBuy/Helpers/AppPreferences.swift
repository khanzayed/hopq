//
//  AppPreferences.swift
//  EventsNearBuy
//
//  Created by Faraz Habib on 17/07/18.
//  Copyright © 2018 Faraz Habib. All rights reserved.
//

import Foundation

struct AppPreferences {
    
    private init () {
        
    }
    
    static var userID:String? {
        get {
            return UserDefaults.standard.string(forKey: "userID")
        }
    }
    
    internal static func userLoggedIn(userID:String) {
        UserDefaults.standard.set(userID, forKey: "userID")
    }
    
    internal static func userLoggedOut() {
        UserDefaults.standard.removeObject(forKey: "userID")
    }
    
}
