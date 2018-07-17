//
//  HelperFunctions.swift
//  EventsNearBuy
//
//  Created by Faraz Habib on 17/07/18.
//  Copyright © 2018 Faraz Habib. All rights reserved.
//

import UIKit

struct HelperFunctions {
    
    private init() {
        
    }
    
    internal static func resetRootViewController() {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let loginVC = storyBoard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController = loginVC
    }
    
    internal static func setAppRootViewController() {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let tabBarVC = storyBoard.instantiateViewController(withIdentifier: "EventsTabbarViewController") as! EventsTabbarViewController
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController = tabBarVC
    }
    
}
