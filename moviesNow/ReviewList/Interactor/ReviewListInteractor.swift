//
//  ReviewListInteractor.swift
//  moviesNow
//
//  Created by Juninho Augusto Chero Hinojosa on 10/12/22.
//

import Foundation


class ReviewListInteractor {
    var presenter : ReviewListPresenterOuputProtocol?
    var api = ReviewManager()

}
 
extension ReviewListInteractor : ReviewListInteractorProtocol {
    
    func getReviewList(movieID : Int) {
        api.delegate = self
        api.fetchMovie(id: movieID)
    }

}

extension ReviewListInteractor : ReviewManagerDelegate {
    func didUpdateReview(_ reviewManager: ReviewManager, reviews: [Review]) {
        //reviewResponse.author_details.rating
        var reviewModelList = [ReviewModel]()
        for reviewResponse in reviews {
            let reviewModel = ReviewModel(author: reviewResponse.author, content: reviewResponse.content,rating: reviewResponse.author_details.rating)
            print(reviewModel.content)
            reviewModelList.append(reviewModel)
        }
        presenter?.setListReview(reviewList: reviewModelList)
    }
    
    func didFailWithError(error: Error) {
        presenter?.returnErrorReview()
    }
    
}
