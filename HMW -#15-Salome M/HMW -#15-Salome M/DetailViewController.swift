//
//  DetailViewController.swift
//  HMW -#15-Salome M
//
//  Created by Mcbook Pro on 12.07.22.
//

import UIKit

class DetailViewController: UIViewController {
    
    var bRec:Bool = true
    
    var movie = [Movie]()
    
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var btnRec: UIButton!
    @IBOutlet weak var movieName: UILabel!
    @IBOutlet weak var releaseData: UILabel!
    @IBOutlet weak var imdb: UILabel!
    @IBOutlet weak var mainActor: UILabel!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var titlee: String?
    var imb: Double?
    var release: String?
    var mainactor: String?
    var mainPoster: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
//
        let btnImage = UIImage(systemName: "star")
        btnRec.setImage(btnImage , for: .normal)
        
        //for receiving data From another Controller
        movieName.text = titlee
        releaseData.text = release
        imdb.text = "\(imb!)"
        mainActor.text = mainactor
        movieImage.image = mainPoster
        
        
        //colection views stuff
        collectionView.dataSource =  self
        collectionView.delegate = self
    }
    
    // favorite button -> favorite film
    
    @IBAction func makeFavorite(_ sender: UIButton) {
        
       bRec = !bRec
            if bRec {
                btnRec.setImage(UIImage(systemName: "star"), for: .normal)
            } else {
                btnRec.setImage(UIImage(systemName: "star.fill"), for: .normal)
            }
        
    }
}

extension DetailViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movie.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SameGenreCollectionCell", for: indexPath) as! SameGenreCollectionCell
        
        let item = movie[indexPath.row]
        cell.movieName.text = item.title
        cell.movieImage.image = item.image
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 100, height: 120)
    }
}
