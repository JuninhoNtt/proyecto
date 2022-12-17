//
//  ReviewListRoute.swift
//  moviesNow
//
//  Created by Juninho Augusto Chero Hinojosa on 10/12/22.
//

import Foundation
import UIKit


class ReviewListRoute {
    
    weak var view : UIViewController?
}

extension ReviewListRoute : ReviewListRouteProtocol {
   
    
    func showAddReviewItem(movieID: Int) {
        
        let itemRate = ItemRate(idMovie: movieID)
        let viewController = RateConfiguration.RateConfigutionViper(itemRate)
        view?.navigationController?.pushViewController(viewController, animated: true)
        
    }
    
    
    func showReviewItem(reviewModel review: ReviewModel) {
        let itemReview = ItemReview(review: review.content, autor: review.author,rating: review.rating)
        let viewController = ReviewDetailConfigurator.makeModule(itemReview)
        view?.present(viewController, animated: true)
    }
 
}
