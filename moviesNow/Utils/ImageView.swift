//
//  ImageView.swift
//  moviesNow
//
//  Created by Juninho Augusto Chero Hinojosa on 12/12/22.
//

import Foundation
import UIKit

extension UIImageView {
    
    
    func getImageFromUrl(imageUrl : String)  {
        
        guard let url = URL(string: Constantes.BASE_URL_IMAGE+imageUrl) else {
            return
        }
      
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if error != nil {
                return
            }
            let cod = response as? HTTPURLResponse
            if cod?.statusCode == Constantes.RESPONSE_OK {
                if let datos = data {
                  
                        DispatchQueue.main.async {
                        self.image = UIImage(data: datos)
                        }
                    }
                }
            }

        
        task.resume()
     
    }
    
}
