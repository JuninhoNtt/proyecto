//
//  ReviewListConfiguration.swift
//  moviesNow
//
//  Created by Juninho Augusto Chero Hinojosa on 10/12/22.
//

import Foundation
import UIKit

class ReviewListConfiguration {
    
    static func makeReviewList(_ itemIdMovie : ItemReviewListProtocol) -> UIViewController {
        
        let presenter = ReviewListPresenter(id: itemIdMovie.movieID)
        let interactor = ReviewListInteractor()
        let route = ReviewListRoute()
       // var view = tableViewController
        let storyBoard = UIStoryboard(name: "ReviewStoryboard", bundle: nil)
        let view = storyBoard.instantiateViewController(withIdentifier: "SCReviews") as? ReviewListViewController
        //presenter
        presenter.interactor = interactor
        presenter.route = route
        presenter.view = view
        
        //interactor
        interactor.presenter = presenter
        
        //route
        //route.presenter = presenter
        route.view = view
        
        //view
        view?.presenter = presenter
        
        return view!
        
    }
    
    
}
