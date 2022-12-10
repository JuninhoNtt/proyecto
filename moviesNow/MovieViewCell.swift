//
//  MovieViewCell.swift
//  moviesNow
//
//  Created by Juninho Augusto Chero Hinojosa on 10/12/22.
//

import UIKit

class MovieViewCell: UITableViewCell {
    
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var descriLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
