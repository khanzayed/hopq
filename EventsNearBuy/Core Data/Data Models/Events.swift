//
//  Events.swift
//  EventsNearBuy
//
//  Created by Faraz Habib on 15/07/18.
//  Copyright © 2018 Faraz Habib. All rights reserved.
//

import Foundation
import CoreData

class Events: NSManagedObject {
    
    @NSManaged public var categoryID: Int32
    @NSManaged public var details: String?
    @NSManaged public var identifier: Int32
    @NSManaged public var image: String?
    @NSManaged public var name: String?
    @NSManaged public var time: NSDate?
    @NSManaged public var price: String?
    @NSManaged public var isFavourite: NSNumber
    @NSManaged public var isLiked: NSNumber
    @NSManaged public var isDisliked: NSNumber

    public class func fetchRequest() -> NSFetchRequest<Events> {
        return NSFetchRequest<Events>(entityName: "Events")
    }
    
    public class func fetchRequest(_ withCategoryID:Int32) -> NSFetchRequest<Events> {
        let request = NSFetchRequest<Events>(entityName: "Events")
        
        let predicate = NSPredicate(format: "categoryID == %d", withCategoryID)
        request.predicate = predicate
        
        return request
    }
    
    public class func fetchRequestForFavEvents() -> NSFetchRequest<Events> {
        let request = NSFetchRequest<Events>(entityName: "Events")
        
        let predicate = NSPredicate(format: "isFavourite == true")
        request.predicate = predicate
        
        return request
    }
    
    internal func liked() {
        isDisliked = NSNumber(value: false)
        isLiked = NSNumber(value: true)
    }
    
    internal func disliked() {
        isDisliked = NSNumber(value: true)
        isLiked = NSNumber(value: false)
    }
    
    internal func addToFavourites() {
        isFavourite = NSNumber(value: true)
    }
    
    internal func removeFromFavourites() {
        isFavourite = NSNumber(value: false)
    }
}

extension Events {
    
    internal func setupEvents(details:[String:Any], categoryID:Int32) {
        identifier = Int32(details["identifier"] as! Int)
        name = details["name"] as? String
        image = details["image"] as? String
        time = details["time"] as? NSDate
        price = details["price"] as? String
        isFavourite = NSNumber(value: false)
        isDisliked = NSNumber(value: false)
        isLiked = NSNumber(value: false)
        
        self.details = details["details"] as? String
        self.categoryID = categoryID
    }
    
}
