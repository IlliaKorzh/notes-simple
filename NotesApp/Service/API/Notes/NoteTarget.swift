//
//  NoteTarget.swift
//  NotesApp
//
//  Created by Ilya Korzhynskiy on 20.09.2021.
//

import Foundation
import Moya

extension Target {
    enum Note {
        case list
        case single(id: String)
        case create(title: String, subtitle: String)
    }
}

extension Target.Note: TargetType, AccessTokenAuthorizable {
    
    var authorizationType: AuthorizationType? {
        .bearer
    }
    
    var baseURL: URL {
        Target.base.appendingPathComponent("notes")
    }
    
    var path: String {
        switch self {
        case .list, .create:
            return ""
        case let .single(id):
            return "/\(id)"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .list, .single:
            return .get
        case .create:
            return .put
        }
    }
    
    var task: Task {
        switch self {
        case .list, .single:
            return .requestPlain
            
        case let .create(title, subtitle):
            return .requestParameters(
                parameters: [
                    "title": title,
                    "subtitle": subtitle],
                encoding: JSONEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        ["Content-Type": "application/json"]
    }
}
