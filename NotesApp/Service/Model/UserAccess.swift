//
//  UserAccess.swift
//  NotesApp
//
//  Created by Ilya Korzhynskiy on 16.09.2021.
//

import Foundation


struct UserAccess: Codable {
  let jwt: String?
  let id: String
  let name: String
  let email: String
}
