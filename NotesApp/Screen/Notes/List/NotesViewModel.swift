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
    
    init(api: NotesAPIProtocol) {
        self.api = api
    }
    
    func bind(viewController: NotesViewController) {
        self.viewController = viewController
    }
    
    func logout() {
        TokenHolder.shared.token = nil
    }
    
    func reloadData() {
        api.list { [weak self] notes in
            self?.viewController.tableView.refreshControl?.endRefreshing()
            switch notes {
            case let .success(notes):
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
}
