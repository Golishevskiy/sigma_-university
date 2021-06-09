//
//  Repo+CoreDataProperties.swift
//  HW22
//
//  Created by Petro Golishevskiy on 09.06.2021.
//
//

import Foundation
import CoreData


extension Repo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Repo> {
        return NSFetchRequest<Repo>(entityName: "Repo")
    }

    @NSManaged public var fullName: String?
    @NSManaged public var id: Int64
    @NSManaged public var itemDescription: String?
    @NSManaged public var name: String?
    @NSManaged public var htmlURL: String?
    @NSManaged public var stars: Int64
    @NSManaged public var repoArray: RepoArray?

}

extension Repo : Identifiable {

}
