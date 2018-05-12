//
//  Product+CoreDataProperties.swift
//  Market
//
//  Created by Higher Visibility on 10/05/2018.
//  Copyright © 2018 Higher Visibility. All rights reserved.
//
//

import Foundation
import CoreData


extension Product {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Product> {
        return NSFetchRequest<Product>(entityName: "Product")
    }

    @NSManaged public var product_id: Int64
    @NSManaged public var product_name: String?
    @NSManaged public var product_category: Category?

}
