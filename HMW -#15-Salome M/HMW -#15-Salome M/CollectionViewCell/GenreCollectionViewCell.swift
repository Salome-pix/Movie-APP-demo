//
//  GanreCollectionViewCell.swift
//  HMW -#15-Salome M
//
//  Created by Mcbook Pro on 14.07.22.
//

import UIKit

class GenreCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var genreLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configCellDesign()
    }

    
    func configCellDesign(){
        genreLabel.layer.cornerRadius = 5
        genreLabel.layer.borderColor = UIColor.black.cgColor
        genreLabel.layer.borderWidth = 2
    }
}
