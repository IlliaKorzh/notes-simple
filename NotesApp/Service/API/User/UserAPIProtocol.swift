//
//  APIProtocol.swift
//  NotesApp
//
//  Created by Ilya Korzhynskiy on 16.09.2021.
//

import Foundation
import Moya

protocol UserAPIProtocol {
    func signIn(email: String, password: String, completion: @escaping (Result<UserAccess, Error>) -> Void)
    func signUp(name: String, email: String, password: String, completion: @escaping (Result<UserAccess, Error>) -> Void)
}
