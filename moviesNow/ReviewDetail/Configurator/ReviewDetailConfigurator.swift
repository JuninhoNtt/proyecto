//
//  ReviewDetailConfigurator.swift
//  moviesNow
//
//  Created by Juninho Augusto Chero Hinojosa on 13/12/22.
//

import Foundation
import UIKit

class ReviewDetailConfigurator {
    
    static func makeModule(_ review : ItemReviewDetailProtocol) -> UIViewController {
       
        let presenter = ReviewDetailPresenter(review)
        
        
        weak var  view = UIStoryboard(name: "ReviewStoryboard", bundle: nil).instantiateViewController(withIdentifier: "ReviewDetallesViewController") as? ReviewDetallesViewController
        
       view?.presenter = presenter
          
        
        return view!
        
    }
    
    
}
