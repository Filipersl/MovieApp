//
//  ExploreViewModel.swift
//  MovieApp
//
//  Created by Filipe Lopes on 27/06/21.
//

import Foundation
import UIKit

protocol NotifyDelegate {
    func notify()
}


class ExploreViewModel {
    private let requester = MovieDBRequester()
    var popularMovies = [Movie]()
    var ratedMovies = [Movie]()
    var nowPlayingMovies = [Movie]()
    var delegate : NotifyDelegate?
    var images = [UIImage]()
    
    public func fetchPopularMovies(){
        requester.fetch(type: .popular, page: 1) { (result) in
            switch result{
            case .failure(let error):
                print(error)
            case .success(let results):
                let result = results.results
                result.forEach({ (movie) in
                    let myMovie = Movie(title: movie.title, image: UIImage(systemName: "text.magnifyingglass")!, description: movie.overview, date: movie.release_date)
                    self.popularMovies.append(myMovie)
                })
            }
        }
        delegate?.notify()
    }
    
    public func fetchRatedMovies(){
        requester.fetch(type: .topRated, page: 1) { (result) in
            switch result{
            case .failure(let error):
                print(error)
            case .success(let results):
                let result = results.results
                result.forEach({ (movie) in
                    let myMovie = Movie(title: movie.title, image: UIImage(systemName: "text.magnifyingglass")!, description: movie.overview, date: movie.release_date)
                    self.ratedMovies.append(myMovie)
                })
            }
        }
        delegate?.notify()
    }
    
    public func fetchNowPlayingMovies(){
        requester.fetchNowPlaying(type: .nowPlaying, page: 1) { (result) in
            switch result{
            case .failure(let error):
                print(error)
            case .success(let results):
                let result = results.results
                result.forEach({ (movie) in
                    let myMovie = Movie(title: movie.title, image: UIImage(systemName: "text.magnifyingglass")!, description: movie.overview, date: movie.release_date)
                    self.nowPlayingMovies.append(myMovie)
                })
            }
        }
        delegate?.notify()
    }
    
    public func fetchImage(path: String){
        requester.fetchImage(type: .image, imagePath: path) { (result) in
            switch result{
            case .failure(let error):
                print(error)
            case .success(let image):
                self.images.append(image)
            }
        }
//        delegate?.notify()
    }
}
