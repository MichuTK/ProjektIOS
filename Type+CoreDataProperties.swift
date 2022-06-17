//
//  Type+CoreDataProperties.swift
//  Proj
//
//  Created by user on 16/06/2022.
//  Copyright © 2022 PL. All rights reserved.
//
//

import Foundation
import CoreData


extension Type {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Type> {
        return NSFetchRequest<Type>(entityName: "Type")
    }

    @NSManaged public var type: String?
    @NSManaged public var bikes: NSSet?

}

// MARK: Generated accessors for bikes
extension Type {

    @objc(addBikesObject:)
    @NSManaged public func addToBikes(_ value: Bike)

    @objc(removeBikesObject:)
    @NSManaged public func removeFromBikes(_ value: Bike)

    @objc(addBikes:)
    @NSManaged public func addToBikes(_ values: NSSet)

    @objc(removeBikes:)
    @NSManaged public func removeFromBikes(_ values: NSSet)
    
    public var bikeArray: [Bike] {
        let set = bikes as? Set<Bike> ?? []
        
        return set.sorted{
            $0.marka! < $1.marka!
        }
    }

}

extension Type : Identifiable {

}
