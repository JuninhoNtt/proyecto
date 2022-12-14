//
//  ImageView.swift
//  moviesNow
//
//  Created by Juninho Augusto Chero Hinojosa on 12/12/22.
//

import Foundation
import UIKit

extension UIImageView {
    
    
    func getImageFromUrl(imageUrl : String, tag : Int? = nil, index : Int? = nil)  {
        
        guard let url = URL(string: Constantes.BASE_URL_IMAGE+imageUrl) else {
            return
        }
       // self.image = nil
       // print("esta es la url : \(url)")
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if error != nil {
                return
            }
            let cod = response as? HTTPURLResponse
            if cod?.statusCode == Constantes.RESPONSE_OK {
                if let datos = data {
                    print("este es mi tag: \(tag) este es mi index: \(index)")
                    if tag == index {
                        DispatchQueue.main.async {
                        self.image = UIImage(data: datos)
                        }
                    }else {
                        print("es diferente ")
                    }
                }
            }

        }
        task.resume()
     
    }
    
}
