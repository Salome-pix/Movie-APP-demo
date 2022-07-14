//
//  MovieCell.swift
//  HMW -#15-Salome M
//
//  Created by Mcbook Pro on 12.07.22.
//

import UIKit

class MovieCell: UITableViewCell {

  
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieImdb: UILabel!
    @IBOutlet weak var movieImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
