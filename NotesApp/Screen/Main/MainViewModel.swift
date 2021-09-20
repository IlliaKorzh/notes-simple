//
//  MainViewModel.swift
//  NotesApp
//
//  Created by Ilya Korzhynskiy on 14.09.2021.
//

import UIKit
import Combine

class MainViewModel: ViewModel {
    
    private var bag: AnyCancellable?
    
    weak var viewController: MainViewController!
    
    func bind(viewController: MainViewController) {
        self.viewController = viewController
        
        bag = TokenHolder.shared.$token
            .map { token in token?.isEmpty != false }
            .map { isEmpty -> MainViewController.Flow in isEmpty ? .auth : .notes }
            .removeDuplicates()
            .receive(on: DispatchQueue.main)
            .assign(to: \.flow, on: viewController)
    }
}
