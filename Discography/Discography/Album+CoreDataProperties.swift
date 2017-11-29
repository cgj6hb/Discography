//
//  Album+CoreDataProperties.swift
//  Discography
//
//  Created by Chris Jansson on 11/29/17.
//  Copyright © 2017 Chris Jansson. All rights reserved.
//
//

import Foundation
import CoreData


extension Album {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Album> {
        return NSFetchRequest<Album>(entityName: "Album")
    }

    @NSManaged public var name: String?
    @NSManaged public var year: String?

}
