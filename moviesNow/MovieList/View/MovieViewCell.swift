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
    
    @IBOutlet weak var movieImageView: UIImageView!
    

    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    override func prepareForReuse() {
        movieImageView.image = UIImage(named: "fondoFoto")
    }

}
