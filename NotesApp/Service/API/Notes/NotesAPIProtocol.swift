//
//  NotesAPIProtocol.swift
//  NotesApp
//
//  Created by Ilya Korzhynskiy on 20.09.2021.
//

import Foundation

protocol NotesAPIProtocol {
    func list(completion: @escaping (Result<[Note], Error>) -> Void)
    func single(id: String, completion: @escaping (Result<Note, Error>) -> Void)
    func create(title: String, subtitle: String, completion: @escaping (Result<Note, Error>) -> Void)
}
