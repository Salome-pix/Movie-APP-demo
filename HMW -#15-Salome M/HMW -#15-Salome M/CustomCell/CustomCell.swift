//
//  CustomCell.swift
//  HMW -#15-Salome M
//
//  Created by Mcbook Pro on 12.07.22.
//

import UIKit

protocol CustomCellProtocol {
    func seenToUpcoming(cell: CustomCell)
}

class CustomCell: UITableViewCell {
    
    
    @IBOutlet weak var upComingTitle: UILabel!
    @IBOutlet weak var upComingIMDB: UILabel!
    
    @IBOutlet weak var movieImage: UIImageView!
    
    
    var delegate: CustomCellProtocol?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
    
    @IBAction func watchLater(_ sender: Any) {
        
        delegate?.seenToUpcoming(cell: self)
    }
    
    
    
}
