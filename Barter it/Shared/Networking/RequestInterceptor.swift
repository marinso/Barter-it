//
//  RequestInterceptor.swift
//  Barter it
//
//  Created by Martin Nasierowski on 17/05/2020.
//  Copyright © 2020 Martin Nasierowski. All rights reserved.
//

import Alamofire

protocol AccessTokenStorage: class {
    typealias JWT = String
    var accessToken: JWT { get set }
}

final class RequestInterceptor: Alamofire.RequestInterceptor {

//    private let storage: AccessTokenStorage
    private let storage: String


//    init(storage: AccessTokenStorage) {
//        self.storage = storage
//    }
    
    init(storage: String) {
        self.storage = storage
    }

    func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
        guard urlRequest.url?.absoluteString.hasPrefix("https://api.authenticated.com") == true else {
            return completion(.success(urlRequest))
        }
        var urlRequest = urlRequest

//        urlRequest.setValue("Bearer " + storage.accessToken, forHTTPHeaderField: "Authorization")
        urlRequest.setValue("Bearer " + storage, forHTTPHeaderField: "Authorization")


        completion(.success(urlRequest))
    }

    func retry(_ request: Request, for session: Session, dueTo error: Error, completion: @escaping (RetryResult) -> Void) {
        guard let response = request.task?.response as? HTTPURLResponse, response.statusCode == 401 else {
            return completion(.doNotRetryWithError(error))
        }

//        refreshToken { [weak self] result in
//            guard let self = self else { return }
//
//            switch result {
//            case .success(let token):
//                self.storage.accessToken = token
//                completion(.retry)
//            case .failure(let error):
//                completion(.doNotRetryWithError(error))
//            }
//        }
    }
}
