//
//  UserReducer.swift
//  NotesApp
//
//  Created by Ilya Korzhynskiy on 06.12.2021.
//

import Foundation

let userReducer: Reducer<App.State.User, Any> = { state, action in
    switch action {
    case let action as LoginAction:
        return .authorising
        
    case let action as LoginSuccessAction:
        return .authorised(
            token: action.token,
            id: "\(action.user)")
        
    case let action as LoginFailureAction:
        return .unauthorised
        
    case let action as ErrorUser:
        return .unauthorised
        
    default:
        return state
    }
}
