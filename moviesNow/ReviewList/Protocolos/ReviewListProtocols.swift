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

//lo que debe mostrar la lista
protocol ValoracionControllerProtocol {
    
    func showReviewList(reviewList: [ReviewModel])
    func getReviewListError(error: String)
    
}
//protocolo a view
protocol ReviewListPresenterInputProtocol {
    
    func getListReview()
    func showReviewItemDetail(reviewModel : ReviewModel)
    func showAddReview()
}
    
//view to protocolo
protocol ReviewListPresenterOuputProtocol {
    
    func setListReview(reviewList : [ReviewModel])
}

//interacto to presenter
protocol ReviewListInteractorProtocol {
    
    func getReviewList(movieID : Int)
    
}
//presenter to router

protocol ReviewListRouteProtocol {
    
    func showReviewItem(reviewModel : ReviewModel)
    func showAddReviewItem(movieID : Int)
}

