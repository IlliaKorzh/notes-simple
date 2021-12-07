//
//  UserState.swift
//  NotesApp
//
//  Created by Ilya Korzhynskiy on 01.12.2021.
//

import Foundation

extension App.State {
    enum User {
        case unauthorised
        case authorising
        case authorised(token: String, id: String)
    }
}
