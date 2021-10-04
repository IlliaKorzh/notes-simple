//
//  DataBase.swift
//  NotesApp
//
//  Created by dlisovoy on 04.10.2021.
//

enum DataBase {}

extension DataBase {
    static let sharedCore = Core(name: "NotesApp")
}
