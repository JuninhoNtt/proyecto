//
//  MovieManager.swift
//  moviesNow
//
//  Created by Juninho Augusto Chero Hinojosa on 1/12/22.
//

import Foundation

protocol MovieManagerDelegate {
    func didUpdateMovies(_ movieManager: MovieManager, moviesResponse:  [MovieResponse])
    func didFailWithError(error: Error)
}

struct MovieManager {
 
    let movieURL = Constantes.BASE_URL+Constantes.NOW_PLAYING+Constantes.API_KEY
   
    var delegate: MovieManagerDelegate?
    
    func fetchMovie() {
        performRequest(with: movieURL)
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
                    if let lstMovies = self.parseJSON(safeData) {
                        self.delegate?.didUpdateMovies(self, moviesResponse: lstMovies)
                    }
                }
                
            }
            task.resume()
        }
    }
  
    func parseJSON(_ moviesData: Data) -> [MovieResponse]? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(MovieData.self, from: moviesData)
            let listMovies = decodedData.results
            return listMovies
            
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
    
}
