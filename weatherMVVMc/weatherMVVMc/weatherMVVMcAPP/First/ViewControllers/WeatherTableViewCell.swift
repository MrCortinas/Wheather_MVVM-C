//
//  WeatherTableViewCell.swift
//  weatherMVVMc
//
//  Created by GCortinas on 10/7/24.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {
    
    @IBOutlet var iconImage: UIImageView!
    @IBOutlet var DateLabel: UILabel!
    @IBOutlet var weatherStatusLabel: UILabel!
    @IBOutlet var maxTempLabel: UILabel!
    @IBOutlet var minTempLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
