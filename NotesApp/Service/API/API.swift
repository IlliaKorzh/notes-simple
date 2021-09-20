//
//  APIManager.swift
//  NotesApp
//
//  Created by Ilya Korzhynskiy on 13.09.2021.
//

import Foundation
import Moya


enum Target {
    static var base: URL {
        URL(string: "https://notes-1ed6c.web.app/api/users")!
    }
}


class API<MoyaTarget: TargetType> {
    
    let provider = MoyaProvider<MoyaTarget>()
    
    func request<T: Decodable>(target: MoyaTarget, completion: @escaping (Result<T, Error>) -> ()) {
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

