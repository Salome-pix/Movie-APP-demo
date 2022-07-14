//
//  ViewController.swift
//  HMW -#15-Salome M
//
//  Created by Mcbook Pro on 12.07.22.
//

import UIKit

class ViewController: UIViewController, CustomCellProtocol {


    
    @IBOutlet weak var GenreCollectionView: UICollectionView!
    
    @IBOutlet weak var sortSegmentControl: UISegmentedControl!
    
    let mainSorceOfData =  Movie.movies
    //Items for table
    var movies = Movie.movies
    
    
    
    //Items for Ganre Colection
    
    let genres: [String] = Genre.allCases.map { $0.rawValue }



    @IBOutlet weak var tableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableView()
        configureCollectionView()
    }
    
    // colectionview Configuration
    func configureCollectionView(){
        GenreCollectionView.dataSource = self
        GenreCollectionView.delegate = self
        GenreCollectionView.register(UINib(nibName: "GenreCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "GenreCollectionViewCell")
        
    }
    
    // tableview Conciguration
    func configureTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        
        
        tableView.register(UINib(nibName: "CustomCell", bundle: nil), forCellReuseIdentifier: "CustomCell")
    }
    
    // sorting items
    @IBAction func sortSegmentPresed(_ sender: Any) {
        switch sortSegmentControl.selectedSegmentIndex {
        case 0:
            movies.sort {$0.isFavourite && $1.isFavourite}
            tableView.reloadData()
            
        case 1:
            movies.sort {$0.imdb < $1.imdb}
            tableView.reloadData()
        default:
            break
        }
    }
    
   
    func seenToUpcoming(cell: CustomCell) {
        if  let indexPath = tableView.indexPath(for: cell){
            let movie = movies[indexPath.row]
            movie.seen = false
            tableView.reloadData()
        }
    }

}
// Extension , table

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return movies.count
    }
    
    // TableViewDatasource
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let curentMovies = movies[indexPath.row]
        
        
        switch indexPath.section {
        
        case 0:
            
            if curentMovies.seen == true {
                
                let customCell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomCell

                customCell.upComingTitle.text = curentMovies.title
                customCell.upComingIMDB.text = "\(curentMovies.imdb)"
                customCell.movieImage.image = curentMovies.image
                customCell.delegate = self
            
                return customCell

            }

        case 1:
            if curentMovies.seen == false {
                
                let movieCell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell

                movieCell.movieImdb .text = "\(curentMovies.imdb)"
                movieCell.movieTitle.text = curentMovies.title
                movieCell.movieImage.image = curentMovies.image

                return movieCell
                
            }
        
        default:
            break
        }
    
     return UITableViewCell()
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let viewForHeader = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 40))
        if section == 0 {
            
            let label = UILabel(frame: viewForHeader.bounds)
            label.text = "Seen movies"
            label.textAlignment = .center
            viewForHeader.addSubview(label)
            
            viewForHeader.backgroundColor = .cyan
        } else {
            let label = UILabel(frame: viewForHeader.bounds)
            label.text = "Upcoming movies"
            label.textAlignment = .center
            viewForHeader.addSubview(label)
            viewForHeader.backgroundColor = .gray
            
        }
        return viewForHeader
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        90
    }
    
    //TableViewDelegat didselect
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
        if let VC = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController {
            
            let curentMovies = movies[indexPath.row]
            VC.mainPoster = curentMovies.image
            VC.titlee = curentMovies.title
            VC.imb = curentMovies.imdb
            VC.release = curentMovies.releaseDate
            VC.mainactor = curentMovies.mainActor
            
            
        
            let genres = curentMovies.genre

            switch genres {
            case .all:
                break
            case .comedy:
                for movie in movies {
                    if movie.genre.rawValue == "Comedy" {
                        VC.movie.append(movie)
                    }
                }
            case .action:
                for movie in movies {
                    if movie.genre.rawValue == "Action" {
                        VC.movie.append(movie)
                    }
                }
            case .drama:
                for movie in movies {
                    if movie.genre.rawValue == "Drama" {
                        VC.movie.append(movie)
                    }
                }
            }

            self.navigationController?.pushViewController(VC, animated: true)
        }
    
    }
}
// CollectionView Delegate, Datasource

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return genres.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GenreCollectionViewCell", for: indexPath) as! GenreCollectionViewCell

        let genre = genres[indexPath.row]
        cell.genreLabel.text = genre
     
        return cell
    }
    


    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        
        let genreItem = genres[indexPath.row]
        
        var justComedyes = [Movie]()
        var justDrama = [Movie]()
        var justActions = [Movie]()
        var reloadedMovies = [Movie]()
        
       
        
        // sorting By genre
        
            if genreItem == "All" {
                
                for movie in  mainSorceOfData {
                    reloadedMovies.append(movie)
                    movies = reloadedMovies
                    tableView.reloadData()
                }
            
        }
        
        for movie in mainSorceOfData {
            if movie.genre == .comedy && genreItem == "Comedy" {
                justComedyes.append(movie)
                movies = justComedyes.sorted { $0.genre < $1.genre }
                tableView.reloadData()
            }
        }
        for movie in mainSorceOfData {
            if movie.genre == .drama && genreItem == "Drama" {
                justDrama.append(movie)
                movies = justDrama
                tableView.reloadData()
            }
        }
        for movie in mainSorceOfData {
            if movie.genre == .action && genreItem == "Action" {
                justActions.append(movie)
                movies = justActions
                tableView.reloadData()
            }
        }

    }
    
}
