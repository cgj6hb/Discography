//
//  Album+CoreDataClass.swift
//  Discography
//
//  Created by Chris Jansson on 11/29/17.
//  Copyright © 2017 Chris Jansson. All rights reserved.
//
//

import UIKit
import CoreData

@objc(Album)
public class Album: NSManagedObject {
    
    convenience init?(name: String?, year: String?) {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        
        guard let managedContext = appDelegate?.persistentContainer.viewContext else {
            return nil
        }
        
        self.init(entity: Album.entity(), insertInto: managedContext)
        
        self.name = name
        self.year = year
    }
}
