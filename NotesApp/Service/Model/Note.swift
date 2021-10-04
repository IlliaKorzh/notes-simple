//
//  File.swift
//  NotesApp
//
//  Created by Ilya Korzhynskiy on 20.09.2021.
//

import Foundation


struct Note: Decodable {
    let id: String
    let title: String
    let subtitle: String
    
    static let database = NotesHandler()
    func store() {
        guard let note = Note.database.add(NoteCoreData.self) else { return }
        note.id = id
        note.title = title
        note.subtitle = subtitle
        Note.database.save()
    }
    // ext to api
}
