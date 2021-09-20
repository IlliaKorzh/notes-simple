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
        URL(string: "https://notes-1ed6c.web.app/api")!
    }
}

class API<MoyaTarget: TargetType> {
    
    let provider: MoyaProvider<MoyaTarget>
    
    init(provider: MoyaProvider<MoyaTarget>) {
        self.provider = provider
    }
    
    func request<T: Decodable>(target: MoyaTarget, completion: @escaping (Result<T, Error>) -> Void) {
        provider.request(target) { result in
            switch result {
            case let .success(response):
                do {
                    switch try JSONDecoder().decode(Response<T>.self, from: response.data) {
                    case let .data(value):
                        completion(.success(value))
                    case let .failure(error):
                        completion(.failure(error))
                    }
                } catch {
                    completion(.failure(error))
                }
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
}

enum Response<T> {
    case data(T)
    case failure(ServerError); struct ServerError: Error, Decodable {
        let code: String
        let message: String
    }
}

extension Response: Decodable where T: Decodable {
    init(from decoder: Decoder) throws {
        if let data = try? T(from: decoder) {
            self = .data(data)
        } else {
            self = .failure(try ServerError(from: decoder))
        }
    }
}

extension Response.ServerError: LocalizedError {
    public var errorDescription: String? {
        message
    }
}
