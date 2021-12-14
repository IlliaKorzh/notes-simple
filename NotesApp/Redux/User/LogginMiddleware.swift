//
//  LogginMiddleware.swift
//  NotesApp
//
//  Created by Ilya Korzhynskiy on 01.12.2021.
//

import Foundation

    // this where API do request 

let signInMiddleware: Middleware<App.State, Any> = { state, action, next in
    
    switch action {
    case let action as LoginAction:
        
//        api.signIn(email: action.login, password: action.password) { user in
//            print(user)
//        }
        break
        
    case let action as LoginSuccessAction:
        break
        
    default:
        break
    }
    
    next(action)
    
}

//protocol Middleware {
//   func handle(action: Action)
//
//}
//
//class SessionMiddleware: Middleware {
//    let network: UserAPIProtocol
//    let store: Store<Any, Any>
//
//    init(network: UserAPIProtocol, store: Store<Any, Any>) {
//        self.network = network
//        self.store = store
//
//    }
//
//    func handle(action: Action) {
//       if let action = action as? LoginAction {
//           network.signIn(email: action.login, password: action.password) { [weak self] apiToken in
//               if let apiToken = TokenHolder.shared.token {
//                   let state = SessionState(authToken: apiToken)
//                   let successAction = LoginSuccessAction(apiToken: apiToken)
//                   self?.store.reducer.reduce(action: successAction, state: state)
//               }
////               else if let error = error {
////                   let failureAction = LoginFailureAction(error: error)
////                   self.store.reduce(action: failureAction)
////               }
//           }
//       }
//   }
//}



//public typealias Middleware<State, Action> = (
//    @escaping () -> State,
//    Action,
//    @escaping (Action) -> ()
//) -> ()

//public protocol MiddlewareProtocol {
//    associatedtype State
//    associatedtype Action
//
//    var middleware: Middleware<State, Action> { get }
//}
//
//public struct GenericMiddleware<State, Action>: MiddlewareProtocol {
//
//    public var middleware: Middleware<State, Action>
//
//    public init(_ middleware: @escaping Middleware<State, Action>) {
//        self.middleware = middleware
//    }
//}
//
//public struct CompositeMiddleware<State, Action>: Middleware {
//
//    public let middleware: Middleware
//
//    public init(_ middlewares: Middleware<State, Action>...) {
//        let initial: Middleware<State, Action> = { store, action, next in next(action) }
//        middleware = middlewares
//            .reversed()
//            .reduce(initial) { result, middleware in
//                { store, action, next in
//                    middleware(store, action) { action in
//                        result(store, action, next)
//                    }
//                }
//            }
//    }
//}