//
//  APIManager.swift
//  NotesApp
//
//  Created by Ilya Korzhynskiy on 13.09.2021.
//

import Foundation
import Moya

class APIManager: APIProtocol {
    
    var provider = MoyaProvider<UserService>(plugins: [NetworkLoggerPlugin(),])
    
    func signUp(name: String?, email: String, password: String, completion: @escaping (Result<UserAccess, Error>) -> Void) {
        request(target: .signIn(email: email, password: password), completion: completion)
    }
    
    func signIn(email: String, password: String, completion: @escaping (Result<UserAccess, Error>) -> Void) {
        request(target: .signUp(name: "", email: email, password: password), completion: completion)
    }
}

private extension APIManager {
    private func request<T: Decodable>(target: UserService, completion: @escaping (Result<T, Error>) -> ()) {
        provider.request(target) { result in
            switch result {
            case let .success(response):
                do {
                    let results = try JSONDecoder().decode(T.self, from: response.data)
                    completion(.success(results))
                } catch let error {
                    completion(.failure(error))
                }
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
}
