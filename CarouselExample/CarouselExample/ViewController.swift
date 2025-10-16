//
//  ViewController.swift
//  CarouselExample
//
//  Created by Kumar, Sumit on 25/03/20.
//  Copyright © 2020 sk. All rights reserved.
//

import UIKit

//Sample model
struct Item {
    var value: UIImage
}

class ViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet weak private var carouselView: CarouselCollectionView!
    
    /// Carousel view Data source containing promotionItem
    private var carouselDataSource: CarouselDataSource<Item>?
    
    // MARK: - Properties
    /// The list of promotionItems
    public var items = [Item]() {
        didSet {
            updateDataSource()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        carouselView.register(UINib(nibName: "CarouselCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CarouselCollectionViewCell")
            
            self.items = [
                Item(value: UIImage(named: "FirstCoin")!),
                Item(value: UIImage(named: "SecondCoin")!),
                Item(value: UIImage(named: "ThirdCoin")!)
            ]
        
    }

    // MARK: - Userdefined methods
    /// Set up the data source variable with promotionItems
    private func updateDataSource() {
        carouselDataSource = CarouselDataSource(model: items, reuseIdentifier: "CarouselCollectionViewCell") { item, cell in
            guard let cell = cell as? CarouselCollectionViewCell,
                  let indexPath = self.carouselView.indexPath(for: cell) else {
                return
            }
            let item = self.items[indexPath.row]
            cell.populate(item: item, index: indexPath.item)
        }
        
        carouselView.dataSource = carouselDataSource
        carouselView.delegate = self
        
        carouselView.reloadData()
    }
}

// MARK: - UICollectionViewDelegate
extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        _ = items[indexPath.row]
        print("Selected Item at index: \(indexPath.row)")
    }
    
}
