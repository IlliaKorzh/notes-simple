//
//  TokenHolder.swift
//  NotesApp
//
//  Created by dlisovoy on 20.09.2021.
//

import Foundation
import Combine

extension TokenHolder {
    static let shared = TokenHolder()
}

final class TokenHolder: ObservableObject {
    @Published var token: String?
}
