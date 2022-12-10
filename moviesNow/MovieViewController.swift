//
//  MovieViewController.swift
//  moviesNow
//
//  Created by Juninho Augusto Chero Hinojosa on 7/12/22.
//

import UIKit

class MovieViewController: UIViewController {

    @IBOutlet weak var novieTableView: UITableView!
    private var listMovies = [Movie]()
    private var movieManager=MovieManager()
    private var activityIndicador = UIActivityIndicatorView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        novieTableView.delegate = self
        novieTableView.dataSource = self
        movieManager.delegate = self
        conIndicador()
        view.addSubview(activityIndicador)
        movieManager.fetchMovie()

    }
    
    
    private func conIndicador(){
        activityIndicador.style = .large
        activityIndicador.center = view.center
        activityIndicador.color = UIColor.red
        activityIndicador.startAnimating()
        
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if let identifier = segue.identifier {
            if identifier == "segueDetalles"{
                let destino = segue.destination as? DetallesController
                let movie = sender as? Movie
                destino?.valorEntregado=movie
            }
        }
    }
    

}
extension MovieViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        listMovies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifierCell", for: indexPath)  as? MovieViewCell
        let movie = listMovies[indexPath.row]
        cell?.titleLabel.text = movie.title
        cell?.descriLabel.text = movie.release_date
        //var confi = UIListContentConfiguration.cell()
        //confi.text = listMovies[indexPath.row].title
        //cell.contentConfiguration = confi
        return cell ?? UITableViewCell()
    }
    
    
    
}

extension MovieViewController : UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movie=listMovies[indexPath.row]
        performSegue(withIdentifier: "segueDetalles", sender: movie)
    }
    
}

extension MovieViewController : MovieManagerDelegate {
    
    func didUpdateMovies(_ movieManager: MovieManager, movies: [Movie]) {
        DispatchQueue.main.async {
            self.listMovies = movies
            self.novieTableView.reloadData()
            self.activityIndicador.stopAnimating()

        }
        
    }
    
    func didFailWithError(error: Error) {
        activityIndicador.stopAnimating()
        print("error: \(error)")
    }
    
}

