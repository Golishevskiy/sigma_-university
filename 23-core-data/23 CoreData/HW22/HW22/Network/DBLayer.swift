//
//  DBLayer.swift
//  HW22
//
//  Created by Petro Golishevskiy on 09.06.2021.
//

import Foundation
import CoreData


private var persistentContainer: NSPersistentContainer = {
    let container = NSPersistentContainer(name: "RepoArray")
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
    
    func fetchRepos() -> [RepoArray] {
        do {
            return try context.fetch(RepoArray.fetchRequest())
        } catch {
            print(error.localizedDescription)
        }
        return [RepoArray]()
    }
    
    func save(requestText: String, items: [Item]) {
        let array = prepareData(searchText: requestText, items: items)
        let new = RepoArray(context: context)
        new.searchText = requestText
        for item in array {
            new.addToRepo(item)
        }
        do {
            try self.context.save()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    private func prepareData(searchText: String, items: [Item]) -> [Repo] {
        var array = [Repo]()
        items.forEach { (item) in
            let newRepo = Repo(context: context)
            newRepo.id = Int64(item.id)
            newRepo.name = item.name
            newRepo.fullName = item.fullName
            newRepo.itemDescription = item.itemDescription
            newRepo.stars = Int64(item.stars ?? 0)
            newRepo.htmlURL = item.owner.htmlURL
            array.append(newRepo)
        }
        return array
    }
}
