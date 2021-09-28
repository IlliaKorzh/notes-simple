//
//  NotesHandler.swift
//  NotesApp
//
//  Created by Ilya Korzhynskiy on 28.09.2021.
//

import CoreData
import UIKit

class NotesHandler {
    private let viewContext: NSManagedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func add<T: NSManagedObject>(_ type: T.Type) -> T? {
        guard let entityName = T.entity().name else { return nil }
        guard let entity = NSEntityDescription.entity(forEntityName: entityName, in: viewContext) else { return nil }
        let object = T(entity: entity, insertInto: viewContext)
        return object
    }
    
    func fetch<T: NSManagedObject>(_ type: T.Type) -> [T] {
        let request = T.fetchRequest()
        do {
            let result = try viewContext.fetch(request)
            return result as! [T]
        } catch {
            print(error.localizedDescription)
            return []
        }
    }
    
    func save() {
        if viewContext.hasChanges {
            do {
                try viewContext.save()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
//    func deleteAllData(_ entity:String) {
//        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entity)
//        fetchRequest.returnsObjectsAsFaults = false
//        do {
//            let results = try viewContext.fetch(fetchRequest)
//            for object in results {
//                guard let objectData = object as? NSManagedObject else {continue}
//                viewContext.delete(objectData)
//            }
//        } catch let error {
//            print("Detele all data in \(entity) error :", error)
//        }
//    }
    
    func delete<T: NSManagedObject>(odject: T) {
        viewContext.delete(odject)
        save()
    }
}
