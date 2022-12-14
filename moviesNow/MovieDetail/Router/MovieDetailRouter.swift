//
//  MovieDetailRouter.swift
//  moviesNow
//
//  Created by Juninho Augusto Chero Hinojosa on 13/12/22.
//

import Foundation
import UIKit


class MovieDetailRouter : MovieDetailRouterProtocol {
    
    var view : UIViewController?
    
    func showReviewList(_ idMovie: Int) {
        let itemIdMovie = ItemReviewModel(movieID: idMovie)
        let viewController = ReviewListConfiguration.makeReviewList(itemIdMovie)
        view?.navigationController?.pushViewController(viewController, animated: true)
    }
}
