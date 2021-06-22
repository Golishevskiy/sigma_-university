//
//  DbBank+CoreDataProperties.swift
//  Currency
//
//  Created by Petro Golishevskiy on 22.06.2021.
//
//

import Foundation
import CoreData


extension DbBank {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DbBank> {
        return NSFetchRequest<DbBank>(entityName: "DbBank")
    }

    @NSManaged public var name: String?
    @NSManaged public var city: String?
    @NSManaged public var street: String?
    @NSManaged public var phone: String?
    @NSManaged public var supportPhone: String?
    @NSManaged public var worldSupportPhone: String?
    @NSManaged public var mail: String?
    @NSManaged public var imageUrl: String?
    @NSManaged public var webSite: String?
    @NSManaged public var internetBanking: String?
    @NSManaged public var updateTime: Int64
}

extension DbBank : Identifiable {

}
