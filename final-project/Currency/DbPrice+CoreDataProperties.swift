//
//  DbPrice+CoreDataProperties.swift
//  Currency
//
//  Created by Petro Golishevskiy on 22.06.2021.
//
//

import Foundation
import CoreData


extension DbPrice {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DbPrice> {
        return NSFetchRequest<DbPrice>(entityName: "DbPrice")
    }

    @NSManaged public var buy: String
    @NSManaged public var sel: String
    @NSManaged public var currency: String

}

extension DbPrice : Identifiable {

}
