//
//  NoteViewModel.swift
//  NotesApp
//
//  Created by Ilya Korzhynskiy on 04.10.2021.
//

import Foundation

class NoteViewModel: ViewModel {
    
    var title: String?
    var subtitle: String?
    var save: (() -> Void)?
    
    let api: NotesAPIProtocol
    weak var viewController: NoteViewController!
    
    init(api: NotesAPIProtocol) {
        self.api = api
    }
    
    func bind(viewController: NoteViewController) {
        self.viewController = viewController
    }
    
    
}
