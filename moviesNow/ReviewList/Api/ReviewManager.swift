//
//  ReviewManager.swift
//  moviesNow
//
//  Created by Juninho Augusto Chero Hinojosa on 4/12/22.
//

import Foundation


struct ReviewManager {
  
   weak var delegate: ReviewManagerDelegate?
    
    func fetchMovie(id : Int?) {
        if let id = id {
             let movieID = String(id)
            let movieURL = Constantes.BASE_URL+movieID+Constantes.REVIEW+Constantes.API_KEY
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

