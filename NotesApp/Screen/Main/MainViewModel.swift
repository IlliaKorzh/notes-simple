//
//  MainViewModel.swift
//  NotesApp
//
//  Created by Ilya Korzhynskiy on 14.09.2021.
//

import UIKit

class MainViewModel: ViewModel {
    
    weak var viewController: MainViewController!
    
    func bind(viewController: UIViewController) {
        guard let viewController = viewController as? MainViewController
        else {
            fatalError(
                """
                    \(self) expected ViewController of type MainViewController,
                    got \(type(of: viewController))
                """)
        }
        self.viewController = viewController
    }
    
    init() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
            self.viewController.flow = .notes
        }
    }
}
