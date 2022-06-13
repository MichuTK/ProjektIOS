//
//  Bike+CoreDataProperties.swift
//  Proj
//
//  Created by student on 06/06/2022.
//  Copyright © 2022 PL. All rights reserved.
//
//

import Foundation
import CoreData


extension Bike {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Bike> {
        return NSFetchRequest<Bike>(entityName: "Entity")
    }

    @NSManaged public var marka: String?
    @NSManaged public var model: String?
    @NSManaged public var cena: Int32

}

extension Bike : Identifiable {
    
}
