//
//  DetallesController.swift
//  moviesNow
//
//  Created by Juninho Augusto Chero Hinojosa on 28/11/22.
//

import UIKit

class DetallesController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func showValoracion(_ sender: UIButton) {
        performSegue(withIdentifier: "segueValoracion", sender: nil)
    }
    
}
