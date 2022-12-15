//
//  ReviewListViewController.swift
//  moviesNow
//
//  Created by Juninho Augusto Chero Hinojosa on 15/12/22.
//

import UIKit

class ReviewListViewController: UIViewController {
    
    private var reviewList = [ReviewModel]()
    
    private var indicador = UIActivityIndicatorView()
    
    var presenter: ReviewListPresenterInputProtocol?
    
    @IBOutlet weak var messageLabel:UILabel!
    
    private var activityIndicador = UIActivityIndicatorView()

    @IBOutlet weak var tableView:UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        confiActivityIndicador()
        view.addSubview(activityIndicador)
        presenter?.getListReview()

    }
    
    @IBAction func addReviewButton(_ sender: UIBarButtonItem) {
        presenter?.showAddReview()
    }
    
    private func confiActivityIndicador(){
        activityIndicador.style = .large
        activityIndicador.center = view.center
        activityIndicador.color = UIColor.red
        activityIndicador.startAnimating()
        
    }

}

extension ReviewListViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let review = reviewList[indexPath.row]
        presenter?.showReviewItemDetail(reviewModel: review)
    }
    
}

extension ReviewListViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return reviewList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "valoracionIdentifier", for: indexPath) as? ReviewViewCell
        let itemReview = reviewList [indexPath.row]
        cell?.setup(review: itemReview)
        return cell ?? UITableViewCell()

    }
    
   
}

extension ReviewListViewController : ReviewViewControllerDelegate{
    func reviewViewControllerDelegate(_ rateViewController: RateViewController, didCreateReview review: String) {
        reviewList.append(ReviewModel(author: "anonimo", content: review, rating: 0))
        tableView.reloadData()
        self.activityIndicador.stopAnimating()

    }
    
}

extension ReviewListViewController : ValoracionControllerProtocol {
    func getReviewListError(error: String) {
        DispatchQueue.main.async {
            self.activityIndicador.stopAnimating()
            self.messageLabel.text = error

        }
    }
    
    
    func showReviewList(reviewList: [ReviewModel]) {
        DispatchQueue.main.async {
            self.reviewList = reviewList
            self.tableView.reloadData()
            self.activityIndicador.stopAnimating()

        }
    }
    
   
 
}
