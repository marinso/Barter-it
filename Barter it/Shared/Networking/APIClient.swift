//
//  APIClient.swift
//  Barter it
//
//  Created by Martin Nasierowski on 16/05/2020.
//  Copyright © 2020 Martin Nasierowski. All rights reserved.
//

import Alamofire

class APIClient {
    static func getItems(completion: @escaping (Result<[Item], AFError>) -> Void) {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.dateDecodingStrategy = .formatted(DateFormatter.itemDateFormatter)
        
        AF.request(APIRouter.items)
            .responseDecodable(decoder: jsonDecoder) { (response: DataResponse<[Item], AFError>) in
                completion(response.result)
        }
    }
}
