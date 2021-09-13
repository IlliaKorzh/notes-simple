//
//  APIManager.swift
//  NotesApp
//
//  Created by Ilya Korzhynskiy on 13.09.2021.
//

import Foundation
import Alamofire

class APIManager {
    static let shareInstance = APIManager()
    
    func callingRegisterAPI(register: RegisterModel) {
        let headers: HTTPHeaders = [
            .contentType("application/json")
        ]
        AF.request(register_url, method: .post, parameters: register, encoder: JSONParameterEncoder.default, headers: headers).response{ response in
            debugPrint(response)
            
        }
    }
}
