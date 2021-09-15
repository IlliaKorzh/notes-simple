//
//  UserService.swift
//  NotesApp
//
//  Created by Ilya Korzhynskiy on 15.09.2021.
//

import Foundation
import Moya

enum UserService {
    case signUp(name: String?, email: String, password: String)
      case signIn(email: String, password: String)
}

extension UserService: TargetType {
    var baseURL: URL {
       return URL(string: "https://notes-1ed6c.web.app/api/users")!
        
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
        return .post
    }
    
    var task: Task {
        switch self {
        case let .signIn(email, password):
            return .requestParameters(parameters: ["email": email, "password": password], encoding: JSONEncoding.default)
        case let .signUp(name, email, password):
            return .requestParameters(parameters: ["name": name ?? "empty", "email": email, "password": password], encoding: JSONEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        return ["Content-Type": "application/json"]
    }
    
    
}
