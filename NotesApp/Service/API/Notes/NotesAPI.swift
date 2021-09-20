//
//  NotesAPI.swift
//  NotesApp
//
//  Created by Ilya Korzhynskiy on 20.09.2021.
//

import Foundation

extension API: NotesAPIProtocol where MoyaTarget == Target.Note {
    
    func list(completion: @escaping (Result<[Note], Error>) -> Void) {
        request(target: .list, completion: completion)
    }
    
    func single(id: String, completion: @escaping (Result<Note, Error>) -> Void) {
        request(target: .single(id: id), completion: completion)
    }
    
    func create(title: String, subtitle: String, completion: @escaping (Result<Note, Error>) -> Void) {
        request(target: .create(title: title, subtitle: subtitle), completion: completion)
    }
}
