//
//  AppStore.swift
//  NotesApp
//
//  Created by Ilya Korzhynskiy on 06.12.2021.
//

import Foundation

typealias AppStore = DefaultStore<App.State, Any>

extension App {
    static let store = DefaultStore(
        reducer: appReducer,
        state: State(
            user: .unauthorised
        ),
        middlewares: [
            logger
        ]
    )
}

let logger: Middleware<App.State, Any> = { state, action, next in
    print("____Redux Logger____")
    print("Action: \(action)")
    print("State: \(state)")
    print("____________________")
    next(action)
}

//let store = DefaultStore(
//    reducer: appReducer,
//    state: App.State(
//        user: .unauthorised
//    ),
//    middlewares: []
//)
