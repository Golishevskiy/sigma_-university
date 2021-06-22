//
//  DBLayer.swift
//  Currency
//
//  Created by Petro Golishevskiy on 21.06.2021.
//

import Foundation
import CoreData

private var persistentContainer: NSPersistentContainer = {
    let container = NSPersistentContainer(name: "DbBank")
    container.loadPersistentStores(completionHandler: { (storeDescription, error) in
        if let error = error as NSError? {
            fatalError("Unresolved error \(error), \(error.userInfo)")
        }
    })
    return container
}()

class DBLayer {
    
    static let shared = DBLayer()
    private let context = persistentContainer.viewContext
    
    
    //    func saveUserData(_ users: [User]) {
    ////        let context = appDelegate.persistentContainer.viewContext
    //        for user in users {
    //            let newUser = NSEntityDescription.insertNewObject(forEntityName: "Users", into: context)
    //            newUser.setValue(user.id, forKey: "id")
    //            newUser.setValue(user.name, forKey: "name")
    //            newUser.setValue(user.email, forKey: "email")
    //            newUser.setValue(user.phone, forKey: "phone")
    //            newUser.setValue(user.website, forKey: "website")
    //            newUser.setValue(user.city, forKey: "city")
    //            newUser.setValue(user.lat, forKey: "lat")
    //            newUser.setValue(user.long, forKey: "long")
    //        }
    //        do {
    //            try context.save()
    //            print("Success")
    //        } catch {
    //            print("Error saving: \(error)")
    //        }
    //    }
    
    func fetchRepos() -> [DbBank] {
        do {
            return try context.fetch(DbBank.fetchRequest())
        } catch {
            print(error.localizedDescription)
        }
        return [DbBank]()
    }
    
    
    func save(bank: Bank) {
        //        let array = prepareData(searchText: requestText, items: items)
        let newBank = DbBank(context: context)
        newBank.name = bank.name
        newBank.city = bank.city
        newBank.street = bank.street
        newBank.phone = bank.phone
        newBank.supportPhone = bank.supportPhone
        newBank.worldSupportPhone = bank.worldSupportPhone
        newBank.mail = bank.mail
        newBank.imageUrl = bank.imageUrl
        newBank.webSite = bank.webSite
        newBank.internetBanking = bank.internetBanking
        newBank.updateTime = Int64(bank.updateTime)
        
        do {
            try self.context.save()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func delete() {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "DbBank")
        fetchRequest.includesPropertyValues = false
        
        do {
            let items = try context.fetch(fetchRequest) as! [NSManagedObject]
            for item in items {
                context.delete(item)
            }
            try context.save()
        } catch {
            print(error.localizedDescription)
        }
    }
}
