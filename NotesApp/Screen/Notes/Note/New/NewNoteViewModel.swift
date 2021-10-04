//
//  NewNoteViewModel.swift
//  NotesApp
//
//  Created by Ilya Korzhynskiy on 04.10.2021.
//

import UIKit

class NewNoteViewModel: NoteViewModel {
    
        private func saveNote() {
        api.create(title: title, subtitle: subtitle) { [weak self] note in
            switch note {
            case let .success(note):
                print(note)
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
