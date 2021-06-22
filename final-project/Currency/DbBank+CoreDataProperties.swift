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

    @NSManaged public var name: String
    @NSManaged public var city: String
    @NSManaged public var street: String
    @NSManaged public var phone: String
    @NSManaged public var attribute: String
    @NSManaged public var supportPhone: String
    @NSManaged public var worldSupportPhone: String
    @NSManaged public var mail: String
    @NSManaged public var webSite: String
    @NSManaged public var imageUrl: String
    @NSManaged public var internetBanking: String
    @NSManaged public var updateTime: Int64
    @NSManaged public var prices: [DbPrice]

}

// MARK: Generated accessors for prices
extension DbBank {

    @objc(insertObject:inPricesAtIndex:)
    @NSManaged public func insertIntoPrices(_ value: DbPrice, at idx: Int)

    @objc(removeObjectFromPricesAtIndex:)
    @NSManaged public func removeFromPrices(at idx: Int)

    @objc(insertPrices:atIndexes:)
    @NSManaged public func insertIntoPrices(_ values: [DbPrice], at indexes: NSIndexSet)

    @objc(removePricesAtIndexes:)
    @NSManaged public func removeFromPrices(at indexes: NSIndexSet)

    @objc(replaceObjectInPricesAtIndex:withObject:)
    @NSManaged public func replacePrices(at idx: Int, with value: DbPrice)

    @objc(replacePricesAtIndexes:withPrices:)
    @NSManaged public func replacePrices(at indexes: NSIndexSet, with values: [DbPrice])

    @objc(addPricesObject:)
    @NSManaged public func addToPrices(_ value: DbPrice)

    @objc(removePricesObject:)
    @NSManaged public func removeFromPrices(_ value: DbPrice)

    @objc(addPrices:)
    @NSManaged public func addToPrices(_ values: NSOrderedSet)

    @objc(removePrices:)
    @NSManaged public func removeFromPrices(_ values: NSOrderedSet)

}

extension DbBank : Identifiable {

}
