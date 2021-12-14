//
//  SignInReduxViewModel.swift
//  NotesApp
//
//  Created by Ilya Korzhynskiy on 08.12.2021.
//

import Foundation

import Foundation
import UIKit
import Combine

final class SignInReduxViewModel: SignInProtocol {
    
    weak var viewController: SignInViewController<SignInReduxViewModel>!
    private let store: AppStore
    private var bag: Set<AnyCancellable> = []
    
    init(store: AppStore) {
        self.store = store
    }
    
    func bind(viewController: SignInViewController<SignInReduxViewModel>) {
        self.viewController = viewController
        setupObserving()
    }
    
    func signIn(email: String, password: String) {
        store.dispatch(action: LoginAction(login: email, password: password))
    }
}

extension SignInReduxViewModel {
    func setupObserving() {
        store
            .$state
            .map(\.user)
            .sink { [weak self] user in
                
                let controls = [
                    self?.viewController.email,
                    self?.viewController.password,
                    self?.viewController.signInButton
                ]
                
                switch user {
                case .unauthorised:
                    controls.forEach { $0?.isEnabled = true
                    }
                    
                case .authorising:
                    controls.forEach { $0?.isEnabled = false
                    }
                    
                case .authorised:
                    break //push
                case .fetchError:
                
                    break
                }
            }.store(in: &bag)
    }
}
