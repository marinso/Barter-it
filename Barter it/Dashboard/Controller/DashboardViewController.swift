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
    
    @IBOutlet weak var collectionView: UICollectionView!
    private var items: [Item] = []
    private let reuseIdentifier = "ItemCell"
   
    private let sectionInsets = UIEdgeInsets(top: 40.0, left: 20.0, bottom: 50.0, right: 20.0)
    private let itemsPerRow: CGFloat = 2

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchItems()
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.reloadData()
    }
}

extension DashboardViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.items.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ItemCollectionViewCell
        cell.backgroundColor = .white
        cell.titleLabel.text = items[indexPath.row].title
        cell.shadowDecorate()
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("You selected cell #\(indexPath.item)!")
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView,layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
    
      let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
      let availableWidth = view.frame.width - paddingSpace
      let widthPerItem = availableWidth / itemsPerRow

      return CGSize(width: widthPerItem, height: widthPerItem)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,insetForSectionAt section: Int) -> UIEdgeInsets {
      return sectionInsets
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
      return sectionInsets.left
    }
}

extension DashboardViewController {
    func fetchItems() {
        APIClient.getItems { (result) in
            switch result {
            case .success(let items):
                self.items = items
                self.collectionView.reloadData()
                print(items)
            case .failure(let error):
                print(error)
            }
        }
    }
}
