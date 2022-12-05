//
//  MoviesTableViewController.swift
//  moviesNow
//
//  Created by Juninho Augusto Chero Hinojosa on 29/11/22.
//

import UIKit

class MoviesTableViewController: UITableViewController {

    var moviesList=[Movie]()
    
    var movieManager=MovieManager()
    
    var indicador = UIActivityIndicatorView()
    
  
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        movieManager.delegate=self
        tableView.isUserInteractionEnabled = false
        confiActivityIndicador()
        view.addSubview(indicador)
        movieManager.fetchMovie()

    
    }
    
    private func confiActivityIndicador(){
        
        let sizeScreen = UIScreen.main.bounds
        let w = sizeScreen.width/2
      //  let h = sizeScreen.height/2
        print("mis medidas son wight: \(sizeScreen.width) y height: \(sizeScreen.height)")
        indicador.center = CGPointMake(w, 0)
        indicador.style = .large
        indicador.color = UIColor.red
        indicador.startAnimating()
    }
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     
        return moviesList.count
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        
        var confi = UIListContentConfiguration.cell()
        confi.text = moviesList[indexPath.row].title
        cell.contentConfiguration=confi
      
       

        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movie=moviesList[indexPath.row]
        performSegue(withIdentifier: "segueDetalles", sender: movie)

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
        if let identifier=segue.identifier{
            
            if identifier == "segueDetalles"{
                let destino=segue.destination as? DetallesController
                destino?.valorEntregado=sender as? Movie
            }else{
                
            }
        }
    }
    
  
   

}
extension MoviesTableViewController: MovieManagerDelegate {
    func didUpdateMovies(_ movieManager: MovieManager, movies: [Movie]) {
        moviesList=movies
        DispatchQueue.main.async {
            self.tableView.reloadData()
            self.indicador.stopAnimating()
            self.tableView.isUserInteractionEnabled = true

        }
    }
    
    func didFailWithError(error: Error) {
        self.indicador.stopAnimating()
        self.tableView.isUserInteractionEnabled = true
        print(error)
    }
    
  

    
   
}
