//
//  ReviewViewController.swift
//  moviesNow
//
//  Created by Juninho Augusto Chero Hinojosa on 29/11/22.
//

import UIKit

protocol ReviewViewControllerDelegate{
    
    func reviewViewControllerDelegate(_ reviewViewController: ReviewViewController, didCreateReview review : String)
}

class ReviewViewController: UITableViewController {
    
    var delegate: ReviewViewControllerDelegate?
    @IBOutlet weak var reviewTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func saveReviewButton(_ sender: UIBarButtonItem) {
        
        var texto = reviewTextField.text ?? ""
        texto = texto.trimmingCharacters(in: .whitespacesAndNewlines)
        if !texto.isEmpty{
            delegate?.reviewViewControllerDelegate(self, didCreateReview: texto)
            navigationController?.popViewController(animated: true)
        }
    }
   
}
