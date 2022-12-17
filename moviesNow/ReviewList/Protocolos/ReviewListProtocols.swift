//
//  ReviewListProtocols.swift
//  moviesNow
//
//  Created by Juninho Augusto Chero Hinojosa on 13/12/22.
//

import Foundation

protocol ItemReviewListProtocol {
    
    var movieID: Int {get}
}

protocol getMovieIdReviewProtocol {
    
    func getMovieId() -> Int
}

//lo que debe mostrar la vista
protocol ReviewListViewControllerProtocol : AnyObject{
    
    func showReviewList(reviewList: [ReviewModel])
    func getReviewListError(error: String)
    
}
//lo que necesita la vista del presenter
protocol ReviewListPresenterInputProtocol {
    
    func getListReview()
    func showReviewItemDetail(reviewModel : ReviewModel)
    func showAddReview()
}
    
//lo que necesita el presenter  del interactor
protocol ReviewListPresenterOuputProtocol : AnyObject {
    
    func setListReview(reviewList : [ReviewModel])
    func returnErrorReview()

}

//lo que necesita el interacotr
protocol ReviewListInteractorProtocol  {
    
    func getReviewList(movieID : Int)
    
}
//presenter to router
protocol ReviewListRouteProtocol : AnyObject {
    
    func showReviewItem(reviewModel : ReviewModel)
    func showAddReviewItem(movieID : Int)
}

//api
protocol ReviewManagerDelegate : AnyObject {
    
    func didUpdateReview(_ reviewManager: ReviewManager, reviews:  [Review])
    func didFailWithError(error: Error)
}


