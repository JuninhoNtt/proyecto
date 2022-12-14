//
//  ReviewDetailProtocols.swift
//  moviesNow
//
//  Created by Juninho Augusto Chero Hinojosa on 13/12/22.
//

import Foundation


protocol ItemReviewDetailProtocol{
    
    var review : String { get }
    var autor : String { get }
    
}

protocol ReviewDetailInputPresenter{
    
    func getReviewDetailDes() -> ItemReviewDetailProtocol
}
