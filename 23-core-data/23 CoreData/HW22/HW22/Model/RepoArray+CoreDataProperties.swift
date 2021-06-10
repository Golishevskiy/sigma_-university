//
//  RepoArray+CoreDataProperties.swift
//  HW22
//
//  Created by Petro Golishevskiy on 09.06.2021.
//
//

import Foundation
import CoreData


extension RepoArray {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<RepoArray> {
        return NSFetchRequest<RepoArray>(entityName: "RepoArray")
    }

    @NSManaged public var searchText: String?
    @NSManaged public var repo: [Repo]?

}

// MARK: Generated accessors for repo
extension RepoArray {

    @objc(addRepoObject:)
    @NSManaged public func addToRepo(_ value: Repo)
    
    @objc(addReposObject:)
    @NSManaged public func addToRepos(_ values: [Repo])

    @objc(removeRepoObject:)
    @NSManaged public func removeFromRepo(_ value: Repo)

    @objc(addRepo:)
    @NSManaged public func addToRepo(_ values: NSSet)

    @objc(removeRepo:)
    @NSManaged public func removeFromRepo(_ values: NSSet)

}

extension RepoArray : Identifiable {

}
