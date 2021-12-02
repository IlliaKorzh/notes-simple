//
//  UserAction.swift
//  NotesApp
//
//  Created by Ilya Korzhynskiy on 01.12.2021.
//

import Foundation

    // make enum with variations and use it.

struct LoginAction: Action {
    var login: String
    var password: String
}
 
struct LoginSuccessAction: Action {
    var apiToken: String
}
 
struct LoginFailureAction: Action {
    var error: Error
}
