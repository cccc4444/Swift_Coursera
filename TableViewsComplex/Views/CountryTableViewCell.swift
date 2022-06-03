//
//  CountryTableViewCell.swift
//  TableViewsComplex
//
//  Created by Danylo Kushlianskyi on 01.06.2022.
//

import UIKit

class CountryTableViewCell: UITableViewCell {
    @IBOutlet weak var flagLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var regionLabel: UILabel!
    @IBOutlet weak var poputaionLabel: UILabel!
    
    func update(country: Country){
        flagLabel.text = country.flag
        nameLabel.text = country.name
        regionLabel.text = country.region
        poputaionLabel.text = country.population
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
