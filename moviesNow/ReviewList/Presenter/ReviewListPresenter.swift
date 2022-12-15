//
//  ReviewListPresenter.swift
//  moviesNow
//
//  Created by Juninho Augusto Chero Hinojosa on 10/12/22.
//

import Foundation



class ReviewListPresenter {
    
    var view : ValoracionControllerProtocol?
    var interactor : ReviewListInteractorProtocol?
    var route : ReviewListRouteProtocol?
    
    var movieReviewId : Int
    
    required init(id : Int) {
        self.movieReviewId = id
    }
}

extension ReviewListPresenter : ReviewListPresenterInputProtocol {
    func returnErrorReview() {
        view?.getReviewListError(error: "Tuvimos un problema al mostrar las review")
    }
    
    func showAddReview() {
        route?.showAddReviewItem(movieID: movieReviewId)
    }
    
    func getListReview() {
        interactor?.getReviewList(movieID: movieReviewId)
    }
    
   
    func showReviewItemDetail(reviewModel: ReviewModel) {
        route?.showReviewItem(reviewModel: reviewModel)
    }
    
}

extension ReviewListPresenter : ReviewListPresenterOuputProtocol {
    
    func setListReview(reviewList: [ReviewModel]) {
        view?.showReviewList(reviewList: reviewList)
    }
}

extension ReviewListPresenter : getMovieIdReviewProtocol {
    func getMovieId() -> Int {
        movieReviewId
    }
  
}
