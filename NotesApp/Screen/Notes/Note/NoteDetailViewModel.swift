//
//  NoteDetailViewModel.swift
//  NotesApp
//
//  Created by Ilya Korzhynskiy on 21.09.2021.
//

import UIKit

class NoteDetailViewModel: ViewModel {

    private let api: NotesAPIProtocol
    private weak var viewController: NoteDetailViewController!

    init(api: NotesAPIProtocol) {
        self.api = api
    }

    func bind(viewController: NoteDetailViewController) {
        self.viewController = viewController
    }
    func addNote(title: String, subtitle: String) {
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
