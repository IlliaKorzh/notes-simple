//
//  NotesViewModel.swift
//  NotesApp
//
//  Created by dlisovoy on 20.09.2021.
//

import Foundation

class NotesViewModel: ViewModel {
    
    private let api: NotesAPIProtocol
    
    init(api: NotesAPIProtocol) {
        self.api = api
    }
    
    func bind(viewController: NotesViewController) {
        
    }
    
    func logout() {
        TokenHolder.shared.token = nil
    }
}
