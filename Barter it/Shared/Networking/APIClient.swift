//
//  APIClient.swift
//  Barter it
//
//  Created by Martin Nasierowski on 16/05/2020.
//  Copyright © 2020 Martin Nasierowski. All rights reserved.
//

import Alamofire

class APIClient {
    
    @discardableResult
    private static func performRequest<T:Decodable>(route: APIRouter, decoder: JSONDecoder = JSONDecoder(), completion:@escaping (Result<T, AFError>)-> Void) -> DataRequest {
        return AF.request(route)
            .responseDecodable(decoder: decoder) { (response: DataResponse<T, AFError>) in
                completion(response.result)
        }
    }
    
    static func login(email: String, password: String, completion: @escaping (Result<User, AFError>) -> Void) {
        performRequest(route: APIRouter.login(email: email, password: password), completion: completion)
    }
    
    static func getItems(completion: @escaping (Result<[Item], AFError>) -> Void) {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.dateDecodingStrategy = .formatted(DateFormatter.itemDateFormatter)
        performRequest(route: APIRouter.items, decoder: jsonDecoder, completion: completion)
    }
}
