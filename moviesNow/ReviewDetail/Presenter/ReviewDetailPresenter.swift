//
//  ReviewDetailPresenter.swift
//  moviesNow
//
//  Created by Juninho Augusto Chero Hinojosa on 13/12/22.
//

import Foundation


class ReviewDetailPresenter  {
    
    private var reviewDetail:ReviewDetailModel
    
    required init(_ review: ItemReviewDetailProtocol) {
        reviewDetail = ReviewDetailModel(review: review.review, autor: review.autor)
    }
    
}

extension ReviewDetailPresenter : ReviewDetailInputPresenter {
    func getReviewDetailDes() -> ItemReviewDetailProtocol {
        reviewDetail
    }
  
}
