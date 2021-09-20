//
//  UserAPI.swift
//  NotesApp
//
//  Created by Ilya Korzhynskiy on 20.09.2021.
//

import Foundation


extension API: UserAPIProtocol where MoyaTarget == Target.User {
    
    func signUp(name: String?, email: String, password: String, completion: @escaping (Result<UserAccess, Error>) -> Void) {
        request(target: .signIn(email: email, password: password), completion: completion)
    }
    
    func signIn(email: String, password: String, completion: @escaping (Result<UserAccess, Error>) -> Void) {
        request(target: .signUp(name: "", email: email, password: password), completion: completion)
    }
}
