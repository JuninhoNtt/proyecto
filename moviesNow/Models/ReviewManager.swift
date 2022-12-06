//
//  ReviewManager.swift
//  moviesNow
//
//  Created by Juninho Augusto Chero Hinojosa on 4/12/22.
//

import Foundation

protocol ReviewManagerDelegate {
    func didUpdateReview(_ reviewManager: ReviewManager, reviews:  [Review])
    func didFailWithError(error: Error)
}

struct ReviewManager {
    let movieURL = "https://api.themoviedb.org/3/movie/{movie_id}/reviews?api_key=9ef350e7424c4a32118de29377a9ea87&language=en-US&page=1"
    
    var delegate: ReviewManagerDelegate?
    
    func fetchMovie(id : Int?) {
        if let ola = id {
            let movieURL = "https://api.themoviedb.org/3/movie/\(ola)/reviews?api_key=9ef350e7424c4a32118de29377a9ea87&language=en-US&page=1"
           // let urlString = "\(movieURL)&q=\(fecha)"
            print("mi url: "+movieURL)
            performRequest(with: movieURL)
        }
       
    }
    
   
    
    func performRequest(with urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print("ayuda error performrequest")
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                
                
                if let safeData = data {
                    print("safedate data")
                    if let lstReviews = self.parseJSON(safeData) {
                        self.delegate?.didUpdateReview(self, reviews: lstReviews)
                    }
                }
                
                
            }
            task.resume()
        }
    }
  
    func parseJSON(_ reviewsData: Data) -> [Review]? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(ReviewData.self, from: reviewsData)
            let listReview = decodedData.results
            print(listReview.count)
            return listReview
            
        } catch {
            print("error no se pudo decodificar")
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
    
}

