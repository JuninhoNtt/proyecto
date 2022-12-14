//
//  RateManager.swift
//  moviesNow
//
//  Created by Juninho Augusto Chero Hinojosa on 10/12/22.
//

import Foundation


protocol RateManagerDelegate{
    func didUpdateRate(_ rateManager: RateManager, rateResponseModel:  RateResponseModel)
    func didFailWithError(error: Error)
}

struct RateManager{
    
    var delegate: RateManagerDelegate?
    var baseUrl = Constantes.BASE_URL
    let apiKey =  Constantes.API_KEY
    let sessionId = Constantes.SESSION_ID
    let rating = Constantes.RATING

    
    func fetchRate(movieID : String,rate :Rate) {
        let rateUrl = baseUrl+movieID+rating+apiKey+sessionId
        
        guard let url = URL(string: rateUrl) else {
            return
        }
        performRequest(with: url,rate: rate)
    }
    
    func performRequest(with urlString: URL,rate : Rate) {
        
        var request = URLRequest(url: urlString)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")

        let body = rate
                
        guard let jsonData = try? JSONEncoder().encode(body) else {
            print("error la convertir en JSON")
            return
        }
        request.httpBody = jsonData
        
        let task = URLSession.shared.dataTask(with: request) { data, request, error in
        
        guard error == nil  else {
                print("error al lacer post")

                return
            }
   
                if let safeData = data {
                    print("safedate data")
                    if let response = self.parseJSON(response: safeData) {
                        let model = RateResponseModel(status_code: response.status_code, status_message: response.status_message)
                        self.delegate?.didUpdateRate(self, rateResponseModel: model)
                    }
                }
                
        }
        task.resume()
        }
    
    func parseJSON(response : Data ) -> RateResponseModel?{
        
        let decoder = JSONDecoder()
        do {
            let rateResponse = try decoder.decode(RateResponse.self, from: response)
            let rateResponseModel = RateResponseModel(status_code: rateResponse.status_code, status_message: rateResponse.status_message)
            return rateResponseModel
            
        } catch {
            print("error no se pudo decodificar")
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
    
}
