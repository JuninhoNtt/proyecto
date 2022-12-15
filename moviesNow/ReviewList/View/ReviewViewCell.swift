//
//  ReviewViewCell.swift
//  moviesNow
//
//  Created by Juninho Augusto Chero Hinojosa on 7/12/22.
//

import UIKit

class ReviewViewCell: UITableViewCell {
    
    @IBOutlet private weak var reviewLabel: UILabel!
    @IBOutlet private weak var autorLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(review : ReviewModel){
       reviewLabel.text = review.content
       autorLabel.text = review.author
    }

}
