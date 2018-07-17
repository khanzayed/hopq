//
//  Categories.swift
//  EventsNearBuy
//
//  Created by Faraz Habib on 15/07/18.
//  Copyright © 2018 Faraz Habib. All rights reserved.
//

import Foundation
import CoreData

class Categories: NSManagedObject {

    @NSManaged public var identifier: Int32
    @NSManaged public var name: String?
    @NSManaged public var image: String?
    
    public class func fetchRequest() -> NSFetchRequest<Categories> {
        return NSFetchRequest<Categories>(entityName: "Categories")
    }
    
    public class func fetchRequest(_ withCategoryID:Int32) -> NSFetchRequest<Categories> {
        let request = NSFetchRequest<Categories>(entityName: "Categories")
        
        let predicate = NSPredicate(format: "identifier == %d", withCategoryID)
        request.predicate = predicate
        
        return request
        
    }

}

extension Categories {
    
    internal func setupCategories(details:[String:Any]) {
        identifier = Int32(details["identifier"] as! Int)
        name = details["name"] as? String
        image = details["image"] as? String
    }
    
}
