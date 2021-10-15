//
//  NewNoteViewModel.swift
//  NotesApp
//
//  Created by Ilya Korzhynskiy on 04.10.2021.
//

import UIKit

class NewNoteViewModel: NoteViewModel {
    
    private let dataBase: DataBase.Notes
    
    
    init(api: NotesAPIProtocol, dataBase: DataBase.Notes) {
        self.dataBase = dataBase
        super.init(api: api)
        save = saveNote
    }
    
        private func saveNote() {
            let titleTxt = self.title
            let subtitleTxt = self.subtitle
        api.create(title: titleTxt!, subtitle: subtitleTxt!) { [weak self] note in
            switch note {
            case let .success(note):
                guard let notee = self?.dataBase.new()
                else { return assertionFailure("Should not be optional") }
                self?.title = note.title
                self?.subtitle = note.subtitle
                notee.id = note.id
                notee.title = note.title
                notee.subtitle = note.subtitle
                
                
                self?.viewController.navigationController?.popViewController(animated: true)
            case let .failure(error):
                let alert = UIAlertController(
                    title: "Warning",
                    message: error.localizedDescription,
                    preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self?.viewController.present(alert, animated: true, completion: nil)
            }
        }
    }
}
