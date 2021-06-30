//
//  MovieDetailVC.swift
//  MovieApp
//
//  Created by Filipe Lopes on 29/06/21.
//

import Foundation
import UIKit

protocol ButtonDelegate {
    func tapped(state : ButtonState)
}

enum ButtonState {
    case favorited
    case unfavoited
}

class MovieDetailVC : UIViewController{
    
    var movie : Movie?
    let viewModel = MovieDetailViewModel()
    
    private let mainView : MovieDetailView = {
        let mainView = MovieDetailView()
        return mainView
    }()
    
    override func viewDidLoad() {
        self.mainView.movie = movie
        self.mainView.setUp(parent: self)
        if self.viewModel.checkMovie(movie: movie!){
            self.mainView.changeButton()
        }
    }
}

extension MovieDetailVC : ButtonDelegate{
    func tapped(state: ButtonState) {
        switch state {
        case .favorited:
            self.viewModel.save(movie: self.movie!)
        case .unfavoited:
            self.viewModel.delete(movie: self.movie!)
        }
    }
}
