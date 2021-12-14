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

let errorMiddleware: Middleware<App.State, Any> = { state, action, next in
    
    next(action)
    
}
//func logInMiddleware(
//    api: UserAPIProtocol
//) -> Middleware<App.State, Any> {
//    return { state, action, dispatch in
//
//        switch action {
//        case  let action as LoginAction:
//            api.signIn(email: action.login, password: action.password) { user in
//                print(user)
//            }
//        default:
//            break
//        }
//    }
//}


//let signInMiddleware: Middleware<App.State, Any> = { state, action, next in
//
//    switch action {
//    case let action as LoginAction :
//        api.signIn(email: action.login, password: action.password) { user in
//            print(user)
//        }
//        break
//    default:
//        break
//    }
//
//    next(action)
//
//}


//
//let store = DefaultStore(
//    reducer: appReducer,
//    state: App.State(
//        user: .unauthorised
//    ),
//    middlewares: []
//)
