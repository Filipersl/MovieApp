//
//  ExploreViewController.swift
//  MovieApp
//
//  Created by Filipe Lopes on 27/06/21.
//

import Foundation
import UIKit

class ExploreViewController : UIViewController{
    
    private var mainView : ExploreMainView?
    private let viewModel = ExploreViewModel()
    
    override func viewDidLoad() {
        self.mainView = ExploreMainView(size: self.view.bounds.size.width)
        self.mainView!.setUp(parent: self)
        self.viewModel.delegate = mainView as! NotifyDelegate
        self.viewModel.fetchPopularMovies()
        self.viewModel.fetchRatedMovies()
        self.viewModel.fetchNowPlayingMovies()
    }
}

extension ExploreViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section  {
        case 0:
            if viewModel.popularMovies.count > 0 { return 6 }else{ return 0 }
        case 1:
            if viewModel.nowPlayingMovies.count > 0 { return 6 }else{ return 0 }
        case 2:
            if viewModel.ratedMovies.count > 0 { return 6 }else{ return 0 }
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: mainView!.moviesCVCName, for: indexPath) as! MoviesCVC
        
        var movie = Movie(title: "", image: UIImage(systemName: "text.magnifyingglass")!, description: "", date: "")
        
        switch indexPath.section  {
        case 0:
            movie = viewModel.popularMovies[indexPath.row]
        case 1:
            movie = viewModel.nowPlayingMovies[indexPath.row]
        case 2:
            movie = viewModel.ratedMovies[indexPath.row]
        default:
            print("Banana")
        }

        cell.setup(movie: movie)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: mainView!.headerCVName, for: indexPath) as! MoviesCollectionReusableView
        var text = " "
        switch indexPath.section {
        case 0:
            text = "Most Popular Movies"
        case 1:
            text = "Now Playing Movies"
        case 2:
            text = "Most Rated Movies"
        default:
            text = "Banana"
        }
        header.setup(text: text)
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.bounds.size.width, height: 40)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        var myMovie = viewModel.popularMovies[0]
        switch indexPath.section {
        case 0:
            myMovie = viewModel.popularMovies[indexPath.row]
        case 1:
            myMovie = viewModel.popularMovies[indexPath.row]
        case 2:
            myMovie = viewModel.popularMovies[indexPath.row]
        default:
            print("")
        }
        let vc = MovieDetailVC()
        vc.movie = myMovie
        self.present(vc, animated: true)
    }
}
