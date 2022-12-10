//
//  RateManager.swift
//  moviesNow
//
//  Created by Juninho Augusto Chero Hinojosa on 10/12/22.
//

import Foundation


protocol RateManagerDelegate{
    func didUpdateRate(_ rateManager: RateManager, mensaje:  String)
    func didFailWithError(error: Error)
    
}


struct RateManager{
    
    var delegate: RateManagerDelegate?
    
    func fetchRate() {
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/238/rating?api_key=9ef350e7424c4a32118de29377a9ea87&guest_session_id=40da595dbea4f5f9706779a996e4e81c") else {
            return
        }
            performRequest(with: url)
        
    }
    
   
    
    func performRequest(with urlString: URL) {
        
        var request = URLRequest(url: urlString)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")

        let body = Rate(value: 9)
                
        guard let jsonData = try? JSONEncoder().encode(body) else {
            print("error la convertir en JSON")
            return
        }
        request.httpBody = jsonData
        
        let task = URLSession.shared.dataTask(with: request) { data, request, error in
            guard let data = data else {
                print("ERROR DID NOT RECEIVE DATA")
                return
            }
            
            guard error == nil  else {
                print("error al lacer post")

                return
            }
            do {
                let response = try JSONSerialization.jsonObject(with: data)
                print("response: \(response)")
                delegate?.didUpdateRate(self, mensaje: "ok todo bien")
                
            }
            catch {
                delegate?.didFailWithError(error: error)
            }
        }
        task.resume()
        }
    
  
   
}
