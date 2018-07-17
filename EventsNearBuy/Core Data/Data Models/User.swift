//
//  Users.swift
//  EventsNearBuy
//
//  Created by Faraz Habib on 16/07/18.
//  Copyright © 2018 Faraz Habib. All rights reserved.
//

import Foundation
import CoreData

class User: NSManagedObject {
    
    @NSManaged public var email: String?
    @NSManaged public var password: String?
    @NSManaged public var notificationStatus: NSNumber
    @NSManaged public var image: String?
    @NSManaged public var name: String?
    
    public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }
    
    public class func fetchRequest(_ identifier:String, password:String) -> NSFetchRequest<User> {
        let request = NSFetchRequest<User>(entityName: "User")
        
        let predicate = NSPredicate(format: "(email == %@) AND (password == %@)", identifier, password)
        request.predicate = predicate
        
        return request
        
    }

    public class func fetchRequest(_ identifier:String) -> NSFetchRequest<User> {
        let request = NSFetchRequest<User>(entityName: "User")
        
        let predicate = NSPredicate(format: "email == %@", identifier)
        request.predicate = predicate
        
        return request
    }

}

extension User {
    
    internal func setupUser(details:[String:Any]) {
        email = details["email"] as? String
        password = details["password"] as? String
        name = details["name"] as? String
        image = details["image"] as? String
        notificationStatus = NSNumber(value: true)
    }
    
}
