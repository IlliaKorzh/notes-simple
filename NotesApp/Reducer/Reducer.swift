//
//  Reducer.swift
//  NotesApp
//
//  Created by Ilya Korzhynskiy on 01.12.2021.
//

import Foundation

//public typealias Reducer<UserState> = (_ action: Action, _ state: UserState?) -> UserState


protocol Reducer {
   func reduce(action: Action, state: State) -> State
}
