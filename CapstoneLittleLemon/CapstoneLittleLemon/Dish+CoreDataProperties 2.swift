//
//  Dish+CoreDataProperties.swift
//  CapstoneLittleLemon
//
//  Created by Sophie Pitcairn on 13/06/2023.
//
//

import Foundation
import CoreData


extension Dish {

    private static
    func request() -> NSFetchRequest<NSFetchRequestResult> {
        let request: NSFetchRequest<NSFetchRequestResult> =
        NSFetchRequest(entityName: String(describing: Self.self))
        request.returnsDistinctResults = true
        request.returnsObjectsAsFaults = true
        return request
    }

    @NSManaged public var image: String?
    @NSManaged public var price: String?
    @NSManaged public var title: String?

}

extension Dish : Identifiable {

}
