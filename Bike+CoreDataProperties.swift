//
//  Bike+CoreDataProperties.swift
//  Proj
//
//  Created by Michal on 16/06/2022.
//  Copyright © 2022 PL. All rights reserved.
//
//

import Foundation
import CoreData


extension Bike {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Bike> {
        return NSFetchRequest<Bike>(entityName: "Bike")
    }

    @NSManaged public var cena: Int32
    @NSManaged public var marka: String?
    @NSManaged public var model: String?
    @NSManaged public var opis: String?
    @NSManaged public var type: Type?

}

extension Bike : Identifiable {

}
