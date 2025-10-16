//
//  CarouselCollectionViewCell.swift
//  CarouselExample
//
//  Created by Kumar, Sumit on 25/03/20.
//  Copyright © 2020 sk. All rights reserved.
//

import UIKit

class CarouselCollectionViewCell: UICollectionViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet weak private var coinsImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        coinsImage.image = UIImage(named: "FirstCoin")
//        coinsImage.image = UIImage(named: "SecondCoin")
//        coinsImage.image = UIImage(named: "ThirdCoin")
    }
    
    // MARK: - Custom methods
    /// Method to populate the secondary view with the recommendation detail
    /// - Parameter recommendation: Recommendation object
//    func populate(item: Item, index: Int) {
//        print("Populating cell at index: \(index)")
//        print("Image value: \(item.value)")
//        coinsImage.image = item.value
//    }

    func populate(item: Item, index: Int) {
        coinsImage.image = item.value
    }

    
}
