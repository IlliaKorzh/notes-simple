//
//  SignUpProtocol.swift
//  NotesApp
//
//  Created by Ilya Korzhynskiy on 06.12.2021.
//

import Foundation

protocol SignUpProtocol: ViewModel {
    func bind(viewController: SignUpViewController<Self>)
    func signUp(email: String, password: String)
}
