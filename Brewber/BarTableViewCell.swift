//
//  BarTableViewCell.swift
//  Brewber
//
//  Created by Alex Brashear on 4/20/16.
//  Copyright © 2016 Alex Brashear. All rights reserved.
//

import UIKit

class BarTableViewCell: UITableViewCell {

    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    struct ViewModel {
        let barName: String
        let barDistance: Double
        
        private var barDistanceString: String {
            return "\(barDistance) miles"
        }
    }
    
    var viewModel: ViewModel? {
        didSet {
            nameLabel.text = viewModel?.barName
            distanceLabel.text = viewModel?.barDistanceString
        }
    }
    
}
