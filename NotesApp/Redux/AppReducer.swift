//
//  AppReducer.swift
//  NotesApp
//
//  Created by Ilya Korzhynskiy on 06.12.2021.
//

import Foundation

let appReducer: Reducer<App.State, Any> = { state, action in
    App.State(
        user: userReducer(state.user, action)
    )
}
