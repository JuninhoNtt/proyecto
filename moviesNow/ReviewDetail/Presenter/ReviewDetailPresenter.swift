//
//  ReviewDetailPresenter.swift
//  moviesNow
//
//  Created by Juninho Augusto Chero Hinojosa on 13/12/22.
//

import Foundation


class ReviewDetailPresenter  {
    
    private var reviewDetail:ReviewDetailModel
    
    init(_ review: ItemReviewDetailProtocol) {
        reviewDetail = ReviewDetailModel(review: review.review, autor: review.autor,rating: review.rating)
    }
    
}

extension ReviewDetailPresenter : ReviewDetailInputPresenter {
    func getReviewDetailDes() -> ItemReviewDetailProtocol {
        reviewDetail
    }
  
}
