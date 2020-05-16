//
//  Item.swift
//  Barter it
//
//  Created by Martin Nasierowski on 16/05/2020.
//  Copyright © 2020 Martin Nasierowski. All rights reserved.
//

import Foundation

struct Item: Decodable {
    let id: String
    let userId: String
    let title: String
    let description: String
    let category: String
    let condition: String
    let mark: String
    let createdAt: Date
    let quantity: Int
    let imageIds: [String]?
    let proposals: [String]?
    let idsOfItemsProposedInOtherItems: [String]?

    enum CodingKeys: String, CodingKey {
        case id
        case userId
        case title = "name"
        case description
        case category
        case condition
        case mark
        case createdAt
        case quantity
        case imageIds
        case proposals
        case idsOfItemsProposedInOtherItems
    }
}


