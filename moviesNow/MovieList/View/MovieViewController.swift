//
//  MovieViewController.swift
//  moviesNow
//
//  Created by Juninho Augusto Chero Hinojosa on 7/12/22.
//

import UIKit


class MovieViewController: UIViewController {

    @IBOutlet weak var novieTableView: UITableView!
    
    private var listMovies = [MovieModel]()
    private var activityIndicador = UIActivityIndicatorView()
    var presenter : MovieListPresenterInputProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        novieTableView.delegate = self
        novieTableView.dataSource = self
        confiActivityIndicador()
        view.addSubview(activityIndicador)
        MovieListConfigurator.makeLista(view: self)
        presenter?.getMovieList()
        
        

    }
    
    
    private func confiActivityIndicador(){
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
      /*  if let identifier = segue.identifier {
            if identifier == "segueDetalles"{
                let destino = segue.destination as? DetallesController
                let movie = sender as? MovieModel
                destino?.valorEntregado=movie
            }
        }*/
    }
    

}
extension MovieViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        listMovies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifierCell", for: indexPath)  as? MovieViewCell
        let movie = listMovies[indexPath.row]
        cell?.titleLabel.text = movie.titulo
        cell?.descriLabel.text = movie.fechaEstreno
        cell?.tag = indexPath.row
       // cell?.imageView?.image = nil

        if cell?.tag == indexPath.row {
            cell?.movieImageView.getImageFromUrl(imageUrl: movie.rutaPoster,tag: cell?.tag,index: indexPath.row)

        }else {
            print("cell tag no es igual al row")
        }
       // cell?.imageView?.image = nil

        return cell ?? UITableViewCell()
    }
    
    
    
    
    
}

extension MovieViewController : UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movie=listMovies[indexPath.row]
        presenter?.showMovieListItem(movieModel: movie)
    }
    
    
    
}


extension MovieViewController : MovieViewControllerProtocol {
    func showMovie(listMovies: [MovieModel]) {
        DispatchQueue.main.async {
            self.listMovies = listMovies
            self.novieTableView.reloadData()
            self.activityIndicador.stopAnimating()

        }
    }
    
    
    
}

