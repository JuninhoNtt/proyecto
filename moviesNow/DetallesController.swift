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
    
    var valorEntregado :Movie?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
         setup(movie: valorEntregado)
        
    }
    
    private func setup(movie: Movie?){
        labelTitle.text=valorEntregado?.title
        estrenoLabel.text = valorEntregado?.release_date
        sinopsisLabel.text = valorEntregado?.overview
        if let valoracion = valorEntregado?.vote_average{
            valoracionLabel.text = String(valoracion)
        }
    }
    
    
    @IBAction func showReviewsButton(_ sender: UIBarButtonItem) {
        //performSegue(withIdentifier: "segueValoracion", sender: nil)
        let nextStoryBoard = UIStoryboard(name: "ReviewStoryboard", bundle: nil)
        let viewController = nextStoryBoard.instantiateViewController(withIdentifier: "SCReviews") as? ValoracionController
        viewController?.movieID = valorEntregado?.id
        if let vc = viewController {
           // present(vc, animated: true)
            navigationController?.pushViewController(vc, animated: true)

        }
        
    }
    

    
}
