//
//  SignUpViewModelRedux.swift
//  NotesApp
//
//  Created by Ilya Korzhynskiy on 06.12.2021.
//

import Foundation
import UIKit
import Combine

final class SignUpReduxViewModel: SignUpProtocol {
    
    weak var viewController: SignUpViewController<SignUpReduxViewModel>!
    private let store: AppStore
    private var bag: Set<AnyCancellable> = []
    
    init(store: AppStore) {
        self.store = store
    }
    
    func bind(viewController: SignUpViewController<SignUpReduxViewModel>) {
        self.viewController = viewController
        setupObserving()
    }
    
    func signUp(email: String, password: String) {
        store.dispatch(action: LoginAction(login: email, password: password))
    }
}

extension SignUpReduxViewModel {
    func setupObserving() {
        store
            .$state
            .map(\.user)
            .sink { [weak self] user in
                
                let controls = [
                    self?.viewController.email,
                    self?.viewController.password,
                    self?.viewController.signUpButton
                ]
                
                switch user {
                case .unauthorised:
                    controls.forEach { $0?.isEnabled = true }
                    
                case .authorising:
                    controls.forEach { $0?.isEnabled = false }
                    
                case .authorised:
                    break //push
                }
            }.store(in: &bag)
    }
}
