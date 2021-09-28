//
//  NotesViewModel.swift
//  NotesApp
//
//  Created by dlisovoy on 20.09.2021.
//

import UIKit

class NotesViewModel: ViewModel {
    
    private let api: NotesAPIProtocol
    private weak var viewController: NotesViewController!
    private(set) var notes: [Note] = []
    
    var noteDetail: Note?
    let database = NotesHandler()

    init(api: NotesAPIProtocol) {
        self.api = api
    }
    
    func bind(viewController: NotesViewController) {
        self.viewController = viewController
    }
    
    func logout() {
        TokenHolder.shared.token = nil
    }
    
    func fetch() -> [NoteCoreData] {
        let result = database.fetch(NoteCoreData.self)
        return result
    }
    
    func reloadData() {
        api.list { [weak self] notes in
            self?.viewController.tableView.refreshControl?.endRefreshing()
            switch notes {
            case let .success(notes):
//                notes.forEach { $0.store() }
//                var result = self?.database.fetch(NoteCoreData.self)
//                result = self?.coreNotes
                self?.notes = notes
                self?.viewController.tableView.reloadData()
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
    func getNote(id: String) {
        api.single(id: id) { note in
            switch note {
            case let .success(note):
                self.noteDetail = note
            case let .failure(error):
                let alert = UIAlertController(
                    title: "Warning",
                    message: error.localizedDescription,
                    preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.viewController.present(alert, animated: true, completion: nil)
            }
        }
    }
}
