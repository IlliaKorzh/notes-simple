//
//  File.swift
//  NotesApp
//
//  Created by Ilya Korzhynskiy on 20.09.2021.
//

import Foundation

struct Note: Decodable {
    let id: String
    let title: String
    let subtitle: String
}
