//
//  ValoracionController.swift
//  moviesNow
//
//  Created by Juninho Augusto Chero Hinojosa on 28/11/22.
//

import UIKit

class ValoracionController: UITableViewController {
    
    var listaReview = [Review]()
    
    var reviewManager=ReviewManager()
    
    var indicador = UIActivityIndicatorView()
    
    var movieID:Int?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        reviewManager.delegate=self
        //tableView.isUserInteractionEnabled = false
        //confiActivityIndicador()
        view.addSubview(indicador)
        reviewManager.fetchMovie(id: movieID)
        print("movieID: \(movieID ?? 0)")
    }
    
    private func confiActivityIndicador(){
        
        indicador.center = CGPoint(x: 0, y: 0)
        indicador.style = .large
        indicador.color = UIColor.red
        indicador.startAnimating()
    }
    
    
    @IBAction func addReviewButton(_ sender: UIBarButtonItem) {
        
        performSegue(withIdentifier: "segueEditar", sender: nil)
    }
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listaReview.count
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "valoracionIdentifier", for: indexPath)
        
        var confi = UIListContentConfiguration.cell()
        confi.text = listaReview[indexPath.row].content
        cell.contentConfiguration=confi
        print("indexpath row: \(indexPath.row)")
        print("indexpath itemm: \(indexPath.item)")
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //performSegue(withIdentifier: "segueEditar", sender: nil)

    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if let identifier = segue.identifier {
            
            switch identifier {
            case "segueEditar" :
                let destino = segue.destination as? ReviewViewController
                destino?.delegate = self
            default:
                print("wrong segue")
            }
            
            
        }
    }
    

}

extension  ValoracionController : ReviewViewControllerDelegate {
    
    func reviewViewControllerDelegate(_ reviewViewController: ReviewViewController, didCreateReview review: String) {
        listaReview.append(Review(author: "anonimo", content: review))
        tableView.reloadData()
    }
    
    
    
}

extension ValoracionController : ReviewManagerDelegate {
    
    func didUpdateReview(_ reviewManager: ReviewManager, reviews: [Review]) {
        
        DispatchQueue.main.async {
            self.listaReview = reviews
            self.tableView.reloadData()
        }
    
    }
    
    func didFailWithError(error: Error) {
        print("error fatal: \(error)")
    }
    
    
    
}
