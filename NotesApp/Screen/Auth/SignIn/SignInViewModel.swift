//
//  SignInViewModel.swift
//  NotesApp
//
//  Created by Ilya Korzhynskiy on 20.09.2021.
//

import UIKit

class SignInViewModel: ViewModel {
    
    let api: UserAPIProtocol
    
    weak var viewController: SignInViewController!
    
    init(api: UserAPIProtocol) {
        self.api = api
    }
    
    func bind(viewController: UIViewController) {
        guard let viewController = viewController as? SignInViewController
        else {
            fatalError(
                """
                    \(self) expected ViewController of type SignInViewController,
                    got \(type(of: viewController))
                """)
        }
        self.viewController = viewController
    }
    
//    init() {
//        DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
//            self.viewController.flow = .notes
//        }
//    }
}
