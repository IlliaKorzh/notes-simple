//
//  Store.swift
//  NotesApp
//
//  Created by Ilya Korzhynskiy on 02.12.2021.
//

import Foundation

typealias Next<Action> = (Action) -> Void
typealias Middleware<State, Action> = (State, Action, Next<Action>) -> Void
typealias Reducer<State, Action> = (State, _ action: Action) -> State

protocol Store: ObservableObject {
    
    associatedtype State
    associatedtype Action
    
    var middlewares: [Middleware<State, Action>] { get }
    var reducer: Reducer<State, Action> { get }
    
    func dispatch(action: Action)
    func getCurrent() -> State
    
}

class DefaultStore<State, Action>: Store {
    
    let middlewares: [Middleware<State, Action>]
    @Published private(set) var state: State
        
        let reducer: Reducer<State, Action>
        
        init(
            reducer: @escaping Reducer<State, Action>,
             state: State,
             middlewares: [Middleware<State, Action>] = []
        ) {
            self.reducer = reducer
            self.state = state
            self.middlewares = middlewares
        }
    
    func dispatch(action: Action) {
        
        objectWillChange.send()
        
        let initial: Middleware<State, Action> = { store, action, next in next(action) }
        
        let chain = middlewares
            .reversed()
            .reduce(initial) { result, middleware in
                { store, action, next in
                    middleware(store, action) { action in
                        result(store, action, next)
                    }
                }
            }
        
        chain(self.state, action, { action in
            self.state = reducer(self.state, action)
        })
    }
    
    func getCurrent() -> State {
        return state
    }
}
