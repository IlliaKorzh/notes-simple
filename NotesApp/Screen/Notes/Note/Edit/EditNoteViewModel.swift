//
//  EditNoteViewModel.swift
//  NotesApp
//
//  Created by Ilya Korzhynskiy on 04.10.2021.
//

import UIKit

class EditNoteViewModel: NoteViewModel {

    private let id: String
    
    init(id: String, api: NotesAPIProtocol) {
        self.id = id
        super.init(api: api)
    }
    
    
}
