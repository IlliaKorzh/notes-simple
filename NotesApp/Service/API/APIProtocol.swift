//
//  APIProtocol.swift
//  NotesApp
//
//  Created by Ilya Korzhynskiy on 16.09.2021.
//

import Foundation
import Moya

protocol APIProtocol {

    var provider: MoyaProvider<UserService> { get }
    
    func signUp(name: String?, email: String, password: String, completion: @escaping (Result<UserAccess, Error>) -> Void)
    
    func signIn(email: String, password: String, completion: @escaping (Result<UserAccess, Error>) -> Void)
}
