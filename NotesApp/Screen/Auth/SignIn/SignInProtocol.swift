//
//  SignInProtocol.swift
//  NotesApp
//
//  Created by Ilya Korzhynskiy on 08.12.2021.
//

import Foundation

protocol SignInProtocol: ViewModel {
    func bind(viewController: SignInViewController<Self>)
    func signIn(email: String, password: String)
}
