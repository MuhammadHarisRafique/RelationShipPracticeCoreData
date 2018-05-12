//
//  Category+CoreDataProperties.swift
//  Market
//
//  Created by Higher Visibility on 10/05/2018.
//  Copyright © 2018 Higher Visibility. All rights reserved.
//
//

import Foundation
import CoreData


extension Category {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Category> {
        return NSFetchRequest<Category>(entityName: "Category")
    }

    @NSManaged public var category_id: Int64
    @NSManaged public var category_name: String?
    @NSManaged public var relationship: NSSet?

}

// MARK: Generated accessors for relationship
extension Category {

    @objc(addRelationshipObject:)
    @NSManaged public func addToRelationship(_ value: Product)

    @objc(removeRelationshipObject:)
    @NSManaged public func removeFromRelationship(_ value: Product)

    @objc(addRelationship:)
    @NSManaged public func addToRelationship(_ values: NSSet)

    @objc(removeRelationship:)
    @NSManaged public func removeFromRelationship(_ values: NSSet)

}
