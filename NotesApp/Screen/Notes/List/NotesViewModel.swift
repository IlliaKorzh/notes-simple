//
//  NotesViewModel.swift
//  NotesApp
//
//  Created by dlisovoy on 20.09.2021.
//

import UIKit

class NotesViewModel: ViewModel {
    
    private let api: NotesAPIProtocol
    private let dataBase: DataBase.Notes
    private weak var viewController: NotesViewController!
    private(set) var notes: [Note] = []
    
    init(api: NotesAPIProtocol, dataBase: DataBase.Notes) {
        self.api = api
        self.dataBase = dataBase
    }
    
    func bind(viewController: NotesViewController) {
        self.viewController = viewController
    }
    
    func logout() {
        TokenHolder.shared.token = nil
        dataBase.cleanData()
    }
    
    func reloadData() {
        api.list { [weak self] notes in
            guard let self = self else { return }
            self.viewController.tableView.refreshControl?.endRefreshing()
            
            switch notes {
            case let .success(notes):
                
                notes.forEach { raw in
                    if self.notes.isEmpty {
                        guard let note = self.dataBase.new()
                        else { return assertionFailure("Should not be optional") }
                        note.id = raw.id
                        note.title = raw.title
                        note.subtitle = raw.subtitle
                    }
                    let baseNotes = self.dataBase
                        .all()
                        .reduce(
                            into: [String? : Note](),
                            { partialResult, note in
                                partialResult[note.id] = note
                            }
                        )
                    if let existing = baseNotes[raw.id] {
                        existing.id = raw.id
                        existing.title = raw.title
                        existing.subtitle = raw.subtitle
                    } else {
                        guard let note = self.dataBase.new()
                        else { return assertionFailure("Should not be optional") }
                        note.id = raw.id
                        note.title = raw.title
                        note.subtitle = raw.subtitle
                    }
                }
                self.notes = self.dataBase.all()
                self.viewController.tableView.reloadData()
                
            case let .failure(error):
                let alert = UIAlertController(
                    title: "Warning",
                    message: error.localizedDescription,
                    preferredStyle: .alert)
                alert.addAction(UIAlertAction(
                    title: "OK",
                    style: .default,
                    handler: nil))
                self.viewController.present(
                    alert,
                    animated: true,
                    completion: nil)
            }
        }
    }
}
