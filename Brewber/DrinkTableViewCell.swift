//
//  DrinkTableViewCell.swift
//  Brewber
//
//  Created by Alex Brashear on 4/19/16.
//  Copyright © 2016 Alex Brashear. All rights reserved.
//

import UIKit

final class DrinkTableViewCell: UITableViewCell {

    @IBOutlet weak var drinkPriceLabel: UILabel!
    @IBOutlet weak var drinkNameLabel: UILabel!
    
    struct ViewModel {
        let drinkNameString: String
        let drinkPrice: Double
        
        private var drinkPriceString: String {
            return "\(drinkPrice)"
        }
    }
    
    var viewModel: ViewModel? {
        didSet {
            drinkNameLabel.text = viewModel?.drinkNameString
            drinkPriceLabel.text = viewModel?.drinkPriceString
        }
    }
    
}
