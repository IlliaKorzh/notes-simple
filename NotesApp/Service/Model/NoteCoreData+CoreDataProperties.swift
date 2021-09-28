//
//  NoteCoreData+CoreDataProperties.swift
//  
//
//  Created by Ilya Korzhynskiy on 27.09.2021.
//
//

import Foundation
import CoreData


extension NoteCoreData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<NoteCoreData> {
        return NSFetchRequest<NoteCoreData>(entityName: "NoteCoreData")
    }

    @NSManaged public var id: String?
    @NSManaged public var title: String?
    @NSManaged public var subtitle: String?

}
