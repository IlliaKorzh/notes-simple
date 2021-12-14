//
//  UserAction.swift
//  NotesApp
//
//  Created by Ilya Korzhynskiy on 01.12.2021.
//

import Foundation

struct LoginAction {
    var login: String
    var password: String
}

struct LoginSuccessAction {
    var token: String
    var user: Any
}

struct LoginFailureAction {
    var error: String 
}
