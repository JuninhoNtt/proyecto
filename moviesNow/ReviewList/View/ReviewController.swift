//
//  ValoracionController.swift
//  moviesNow
//
//  Created by Juninho Augusto Chero Hinojosa on 28/11/22.
//

import UIKit



class ValoracionController: UITableViewController {
    
    var listaReview = [ReviewModel]()
    
    private var indicador = UIActivityIndicatorView()
    
    var presenter: ReviewListPresenterInputProtocol?
    
            
    override func viewDidLoad() {
        super.viewDidLoad()
       
        presenter?.getListReview()
    }
    
    @IBAction func addReviewButton(_ sender: UIBarButtonItem) {
        presenter?.showAddReview()
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listaReview.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "valoracionIdentifier", for: indexPath) as? ReviewViewCell
        let review = listaReview [indexPath.row]
        cell?.reviewLabel.text = review.content
        cell?.setup(review: review)
        return cell ?? UITableViewCell()
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let review = listaReview[indexPath.row]
        presenter?.showReviewItemDetail(reviewModel: review)

    }


}

extension  ValoracionController : ReviewViewControllerDelegate {
    
    func reviewViewControllerDelegate(_ rateViewController: RateViewController, didCreateReview review: String) {
        listaReview.append(ReviewModel(author: "anonimo", content: review))
        tableView.reloadData()
    }
    
    
}

extension ValoracionController : ValoracionControllerProtocol {
    func showReviewList(reviewList: [ReviewModel]) {
        
        DispatchQueue.main.async {
            self.listaReview = reviewList
            self.tableView.reloadData()
        }
    }
    
    func getReviewListError(error: String) {
        //
    }
    
}
