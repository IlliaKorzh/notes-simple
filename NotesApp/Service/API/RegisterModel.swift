//
//  RegisterModel.swift
//  NotesApp
//
//  Created by Ilya Korzhynskiy on 13.09.2021.
//

import Foundation

struct RegisterModel: Encodable {
    let email: String
    let password: String
}
