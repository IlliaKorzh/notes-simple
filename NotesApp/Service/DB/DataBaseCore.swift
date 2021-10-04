//
//  NotesHandler.swift
//  NotesApp
//
//  Created by Ilya Korzhynskiy on 28.09.2021.
//

import CoreData

extension DataBase {
    
    class Core {
        
        let name: String
        
        init(name: String) {
            self.name = name
        }
        
        private(set) lazy var managedObjectContext: NSManagedObjectContext = {
            let managedObjectContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
            managedObjectContext.parent = self.privateManagedObjectContext
            return managedObjectContext
        }()
        
        private lazy var privateManagedObjectContext: NSManagedObjectContext = {
            var managedObjectContext = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
            managedObjectContext.persistentStoreCoordinator = self.persistentStoreCoordinator
            return managedObjectContext
        }()
        
        private lazy var managedObjectModel: NSManagedObjectModel = {
            guard let modelURL = Bundle.main.url(forResource: self.name, withExtension: "momd") else {
                fatalError("Unable to Find Data Model")
            }
            
            guard let managedObjectModel = NSManagedObjectModel(contentsOf: modelURL) else {
                fatalError("Unable to Load Data Model")
            }
            
            return managedObjectModel
        }()
        
        private lazy var persistentStoreCoordinator: NSPersistentStoreCoordinator = {
            let persistentStoreCoordinator = NSPersistentStoreCoordinator(managedObjectModel: self.managedObjectModel)
            
            let fileManager = FileManager.default
            let storeName = "\(self.name).sqlite"
            
            let documentsDirectoryURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0]
            
            let persistentStoreURL = documentsDirectoryURL.appendingPathComponent(storeName)
            
            do {
                let options = [ NSInferMappingModelAutomaticallyOption : true,
                          NSMigratePersistentStoresAutomaticallyOption : true]
                
                try persistentStoreCoordinator.addPersistentStore(ofType: NSSQLiteStoreType,
                                                                  configurationName: nil,
                                                                  at: persistentStoreURL,
                                                                  options: options)
            } catch {
                fatalError("Unable to Load Persistent Store")
            }
            
            return persistentStoreCoordinator
        }()
        
        // MARK: - Core Data Stack
        
        func add<T: NSManagedObject>() -> T? {
            let context = managedObjectContext
            guard
                let entityName = T.entity().name,
                let entity = NSEntityDescription.entity(
                    forEntityName: entityName,
                    in: context)
            else { return nil }
            
            return T(
                entity: entity,
                insertInto: context)
        }
        
        func fetch<T: NSManagedObject>() -> [T] {
            let request = T.fetchRequest()
            do {
                let result = try managedObjectContext.fetch(request)
                return result as! [T]
            } catch {
                print(error.localizedDescription)
                return []
            }
        }
        
        func fetch<T: NSManagedObject>(id: String) -> T? {
            
            let request = T.fetchRequest()
            request.fetchLimit = 1
            request.predicate = NSPredicate(
                format: "id LIKE %@", id
            )
            
            do {
                let result = try managedObjectContext.fetch(request)
                return result.first as? T
            } catch {
                print(error.localizedDescription)
                return nil
            }
        }
        
        func delete<T: NSManagedObject>(odject: T) {
            managedObjectContext.delete(odject)
            //        save()
        }
        
        func save() {
            managedObjectContext.perform {
                do {
                    if self.managedObjectContext.hasChanges {
                        try self.managedObjectContext.save()
                    }
                } catch {
                    let saveError = error as NSError
                    print("Unable to Save Changes of Managed Object Context")
                    print("\(saveError), \(saveError.localizedDescription)")
                }
                
                self.privateManagedObjectContext.perform {
                    do {
                        if self.privateManagedObjectContext.hasChanges {
                            try self.privateManagedObjectContext.save()
                        }
                    } catch {
                        let saveError = error as NSError
                        print("Unable to Save Changes of Private Managed Object Context")
                        print("\(saveError), \(saveError.localizedDescription)")
                    }
                }
                
            }
        }
    }
}
