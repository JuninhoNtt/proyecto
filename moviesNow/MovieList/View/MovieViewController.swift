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
        presenter?.getMovieList()
        

    }
    
    private func confiActivityIndicador(){
        activityIndicador.style = .large
        activityIndicador.center = view.center
        activityIndicador.color = UIColor.red
        activityIndicador.startAnimating()
        
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
        cell?.movieImageView.getImageFromUrl(imageUrl: movie.rutaPoster)

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
    func showErrorView() {
         activityIndicador.stopAnimating()
       
    }
    
    func showMovie(listMovies: [MovieModel]) {
        DispatchQueue.main.async {
            self.listMovies = listMovies
            self.novieTableView.reloadData()
            self.activityIndicador.stopAnimating()

        }
    }
   
}

