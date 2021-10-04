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
    }

    func reloadData() {
        api.list { [weak self] notes in
            guard let self = self else { return }
            
            self.viewController.tableView.refreshControl?.endRefreshing()
            switch notes {
            case let .success(notes):
                
                notes.forEach { raw in
                    
                    guard let note = self.dataBase.empty()
                    else { return assertionFailure("Should not be optional") }
                    
                    note.id = raw.id
                    note.title = raw.title
                    note.subtitle = raw.subtitle
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
