//
//  User.swift
//  NotesApp
//
//  Created by Ilya Korzhynskiy on 15.09.2021.
//

import Foundation

struct User: Decodable {
    let jwt: String
    let id: String
    let email: String
    let name: String
}
