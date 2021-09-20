//
//  MainViewModel.swift
//  NotesApp
//
//  Created by Ilya Korzhynskiy on 14.09.2021.
//

import UIKit

class MainViewModel: ViewModel {
    
    weak var viewController: MainViewController!
    
    func bind(viewController: MainViewController) {
        self.viewController = viewController
    }
    
    init() {
//        DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
//            self.viewController.flow = .notes
//        }
    }
}
