//
//  User.swift
//  Barter it
//
//  Created by Martin Nasierowski on 17/05/2020.
//  Copyright © 2020 Martin Nasierowski. All rights reserved.
//

import Foundation

struct User: Decodable {
    let id: String
    let email: String
    let token: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case email
        case token
    }
}
