//
//  DataAccessor.swift
//  EventsNearBuy
//
//  Created by Faraz Habib on 15/07/18.
//  Copyright © 2018 Faraz Habib. All rights reserved.
//

import UIKit
import CoreData

class DataAccessor {
    
    static let shared = DataAccessor()
    
    var loggedInUser:User!
    
    var appDelegate:AppDelegate!
    var managedObjectContext:NSManagedObjectContext!
    
    private init() {
        self.appDelegate = UIApplication.shared.delegate as! AppDelegate
        self.managedObjectContext = self.appDelegate.persistentContainer.viewContext
    }
    
    internal func checkIfDataExist() -> Bool {
        do {
            if let results = try managedObjectContext.fetch(Categories.fetchRequest()) as? [Categories] {
                return (results.count > 0)
            }
        } catch {
            print ("There was an error")
        }
        return false
    }
    
    internal func saveSampleData() {
        for cat in SampleData.categories {
            let category = NSEntityDescription.insertNewObject(forEntityName: "Categories", into: managedObjectContext) as! Categories
            category.setupCategories(details: cat)
            
            let sampleEvents = SampleData.events[category.identifier]!
            for event in sampleEvents {
                let events = NSEntityDescription.insertNewObject(forEntityName: "Events", into: managedObjectContext) as! Events
                events.setupEvents(details: event, categoryID: category.identifier)
            }
        }
        
        save()
    }
    
    internal func fetchAllCategories() -> [Categories] {
        do {
            if let results = try managedObjectContext.fetch(Categories.fetchRequest()) as? [Categories] {
                return results
            }
        } catch {
            print ("There was an error")
        }
        return []
    }
    
    internal func fetchCategory(_ categoryID:Int32) -> [Categories] {
        do {
            let results = try managedObjectContext.fetch(Categories.fetchRequest(categoryID))
            return results
        } catch {
            print ("There was an error")
        }
        return []
    }
    
    internal func fetchAllEvents() -> [Events] {
        do {
            if let results = try managedObjectContext.fetch(Events.fetchRequest()) as? [Events] {
                return results
            }
        } catch {
            print ("There was an error")
        }
        return []
    }
    
    internal func fetchEventsForCategory(_ categoryID:Int32) -> [Events] {
        do {
            let results = try managedObjectContext.fetch(Events.fetchRequest(categoryID))
            return results
        } catch {
            print ("There was an error")
        }
        return []
    }
    
    internal func fetchFavouriteEvents() -> [Events] {
        do {
            let results = try managedObjectContext.fetch(Events.fetchRequestForFavEvents())
            return results
        } catch {
            print ("There was an error")
        }
        return []
    }
    
    internal func setupUser(details:[String:Any]) {
        let user = NSEntityDescription.insertNewObject(forEntityName: "User", into: managedObjectContext) as! User
        user.setupUser(details: details)
        loggedInUser = user
        
        save()
    }
    
    internal func checIfUserExist(_ email:String, password:String) -> Bool {
        do {
            let results = try managedObjectContext.fetch(User.fetchRequest(email, password: password))
            if results.count > 0 {
                loggedInUser = results[0]
                return true
            } else {
                return false
            }
        } catch {
            print ("There was an error")
        }
        return false
    }
    
    internal func checkIfUserExist(_ email:String) -> Bool {
        do {
            let results = try managedObjectContext.fetch(User.fetchRequest(email))
            if results.count > 0 {
                loggedInUser = results[0]
                return true
            }
            return false
        } catch {
            print ("There was an error")
        }
        return false
    }
    
    internal func deleteUser() {
        loggedInUser = nil
    }
    
    internal func save() {
        do {
            try managedObjectContext.save()
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
}
