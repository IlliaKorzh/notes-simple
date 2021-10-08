//
//  NotesDataBase.swift
//  NotesApp
//
//  Created by dlisovoy on 04.10.2021.
//

import CoreData

@objc(Note)
class Note: NSManagedObject { }

extension DataBase {

    final class Notes {
        
        private let core: Core
        
        init(core: Core) {
            self.core = core
        }
        
        func all() -> [Note] {
            core.fetch()
        }
        
        func single(id: String) -> Note? {
            core.fetch(id: id)
        }
        
        func new() -> Note? {
            core.add()
        }
        
        func delete(object: Note) {
            core.delete(odject: object)
        }
        
        func cleanData() {
            core.clearCoreDataNotes()
        }
    }
}
