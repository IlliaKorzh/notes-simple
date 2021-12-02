//
//  LogginMiddleware.swift
//  NotesApp
//
//  Created by Ilya Korzhynskiy on 01.12.2021.
//

import Foundation

    // this where API do request 

protocol Middleware {
   func handle(action: Action) -> Action

}

//class SessionMiddleware: Middleware {
//    let network: UserAPIProtocol!
////   let store: Store!
//   func handle(action: Action) -> Action {
//       if let action = action as? LoginAction {
//           network.signIn(email: action.login, password: action.password) { apiToken in
//               if let apiToken = TokenHolder.shared.token {
//                   let successAction = LoginSuccessAction(apiToken: apiToken)
//                   self.store.reduce(action: successAction)
//               }
//               else if let error = error {
//                   let failureAction = LoginFailureAction(error: error)
//                   self.store.reduce(action: failureAction)
//               }
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
//public struct CompositeMiddleware<State, Action>: MiddlewareProtocol {
//
//    public let middleware: Middleware<State, Action>
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
