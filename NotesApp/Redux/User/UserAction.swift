//
//  UserAction.swift
//  NotesApp
//
//  Created by Ilya Korzhynskiy on 01.12.2021.
//

import Foundation

    // make enum with variations and use it.
//enum LoginAction: Action {
//    case login(email: String, password: String)
//    case loginSuccess(token: String?)
//    case loginFailure(error: Error)
//}

struct LoginAction {
    var login: String
    var password: String
}

struct LoginSuccessAction {
    var token: String
    var user: Any
}

struct LoginFailureAction {
    var error: Error
}
