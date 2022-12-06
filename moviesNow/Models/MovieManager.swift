//
//  MovieManager.swift
//  moviesNow
//
//  Created by Juninho Augusto Chero Hinojosa on 1/12/22.
//

import Foundation

protocol MovieManagerDelegate {
    func didUpdateMovies(_ movieManager: MovieManager, movies:  [Movie])
    func didFailWithError(error: Error)
}

struct MovieManager {
 
let movieURL = "https://api.themoviedb.org/3/movie/now_playing?api_key=9ef350e7424c4a32118de29377a9ea87"
   
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
                        self.delegate?.didUpdateMovies(self, movies: lstMovies)
                    }
                }
                
            }
            task.resume()
        }
    }
  
    func parseJSON(_ moviesData: Data) -> [Movie]? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(MovieData.self, from: moviesData)
            let listMovies = decodedData.results
            print(listMovies.count)
            return listMovies
            
        } catch {
            print("error no se pudo decodificar")
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
    
}
