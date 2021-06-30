//
//  FavouriteViewController.swift
//  MovieApp
//
//  Created by Filipe Lopes on 27/06/21.
//

import Foundation
import UIKit

class FavoriteViewController : UIViewController{
    
    private var mainView : FavouriteMainView?
    
    private let viewModel = FavoriteViewModel()
    
    override func viewDidLoad() {
        self.mainView = FavouriteMainView(width: self.view.bounds.size.width)
        self.mainView!.setUp(parent: self)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.viewModel.refreshData()
        self.mainView?.reloadCV()
    }
}

extension FavoriteViewController : UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let movies = viewModel.getMovies()
        if movies.count == 0{
            self.mainView!.clearCV()
        }
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: mainView!.moviesCVCName, for: indexPath) as! MoviesCVC
        
        let movies = viewModel.getMovies()
        let movie = movies[indexPath.row]
    
        cell.setup(movie: movie)
        return cell
    }
    
    
}
