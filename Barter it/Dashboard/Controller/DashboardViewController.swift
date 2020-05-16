//
//  DashboardViewController.swift
//  Barter it
//
//  Created by Martin Nasierowski on 16/05/2020.
//  Copyright © 2020 Martin Nasierowski. All rights reserved.
//

import UIKit
import Alamofire

class DashboardViewController: UIViewController {
    var items: [Item] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchItems()
    }
}

extension DashboardViewController {
    func fetchItems() {
        APIClient.getItems { (result) in
            switch result {
            case .success(let articles):
                print(articles)
            case .failure(let error):
                print(error)
            }
        }
    }
}
