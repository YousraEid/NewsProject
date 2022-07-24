//
//  CountriesCollectionViewCell.swift
//  News
//
//  Created by apple on 23/07/2022.
//

import UIKit

class CountriesCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var countryName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configureCell(with country : Country){
        countryName.text = country.countryName
    }

}
