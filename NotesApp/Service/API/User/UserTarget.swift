//
//  UserService.swift
//  NotesApp
//
//  Created by Ilya Korzhynskiy on 15.09.2021.
//

import Foundation
import Moya

extension Target {
    enum User {
        case signUp(name: String?, email: String, password: String)
        case signIn(email: String, password: String)
    }
}

extension Target.User: TargetType {
    
    var baseURL: URL {
        Target.base
    }
    
    var path: String {
        switch self {
        case .signIn:
            return "signin"
        case.signUp:
            return "signup"
        }
    }
    
    var method: Moya.Method {
        .post
    }
    
    var task: Task {
        switch self {
        case let .signIn(email, password):
            return .requestParameters(
                parameters: [
                    "email": email,
                    "password": password],
                encoding: JSONEncoding.default)
        case let .signUp(name, email, password):
            return .requestParameters(
                parameters: [
                    "name": name as Any,
                    "email": email,
                    "password": password],
                encoding: JSONEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        ["Content-Type": "application/json"]
    }
}
