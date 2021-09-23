//
//  SignUpViewModel.swift
//  NotesApp
//
//  Created by Ilya Korzhynskiy on 21.09.2021.
//

import Foundation
import UIKit

class SignUpViewModel: ViewModel {
    
    weak var viewController: SignUpViewController!
    private let api: UserAPIProtocol
    
    init(api: UserAPIProtocol) {
        self.api = api
    }
    
    func bind(viewController: SignUpViewController) {
        self.viewController = viewController
    }
    
    func signUp(email: String, password: String) {
        
        let controls = [
            viewController.email,
            viewController.password,
            viewController.signUpButton
        ]
        
        controls.forEach { $0?.isEnabled = false }
        
        api.signUp(name: email, email: email, password: password) { [weak self] result in
            
            controls.forEach { $0?.isEnabled = true }
            
            self?.viewController.password.text = nil
            
            switch result {
            case let .success(user):
                TokenHolder.shared.token = user.jwt
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
