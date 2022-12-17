//
//  DetallesController.swift
//  moviesNow
//
//  Created by Juninho Augusto Chero Hinojosa on 28/11/22.
//

import UIKit



class DetallesController: UITableViewController {

    @IBOutlet private weak var labelTitle: UILabel!
    @IBOutlet private weak var valoracionLabel: UILabel!
    @IBOutlet private weak var estrenoLabel: UILabel!
    @IBOutlet private weak var sinopsisLabel: UILabel!
    @IBOutlet private weak var movieImageView: UIImageView!
    var  presenter: MovieDetailInputProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = UIColor.white
        setup(movie: presenter)
        
    }
    
  private func setup(movie: MovieDetailInputProtocol?){
       labelTitle.text = movie?.getMovie().titulo
        estrenoLabel.text = movie?.getMovie().fechaEstreno
        sinopsisLabel.text = movie?.getMovie().sinopsis
         if let valoracion = movie?.getMovie().rating{
            valoracionLabel.text = String(valoracion)
        }
      movieImageView.getImageFromUrl(imageUrl: movie?.getMovie().rutaPoster ?? "")
    }
    
    
    @IBAction func showReviewsButton(_ sender: UIBarButtonItem) {
        if let id  = presenter?.getMovie().id {
            presenter?.goToReviewList(id)
        }

    }
  
}
