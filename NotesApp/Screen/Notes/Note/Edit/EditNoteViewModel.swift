//
//  EditNoteViewModel.swift
//  NotesApp
//
//  Created by Ilya Korzhynskiy on 04.10.2021.
//

import UIKit

class EditNoteViewModel: NoteViewModel {

    private let id: String
    private let dataBase: DataBase.Notes
    
    init(id: String, api: NotesAPIProtocol, dataBase: DataBase.Notes) {
        self.id = id
        self.dataBase = dataBase
        super.init(api: api)
        setup()
    }
    
    private func setup() {
        guard let note = dataBase.single(id: id)
        else { return }
        
        self.title = note.title
        self.subtitle = note.subtitle
    }
}
