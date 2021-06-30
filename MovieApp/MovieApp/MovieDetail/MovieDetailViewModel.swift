//
//  MovieDetailViewModel.swift
//  MovieApp
//
//  Created by Filipe Lopes on 29/06/21.
//

import Foundation
import CoreData
import UIKit

class MovieDetailViewModel {
    
    private var myMovies : [Movie] = []
    private var coreData : MoviesCoreData?
    
    init() {
        guard let appDelegate =
          (UIApplication.shared.delegate as? AppDelegate) else {
            
          return
        }
        coreData = MoviesCoreData(appDelegate: appDelegate)
        self.getMovies()
    }
    
    private func getMovies(){
        myMovies = MoviesCoreData.movies
    }
    
    func checkMovie(movie: Movie)->Bool{
        self.getMovies()
        for aMovie in myMovies{
            if aMovie.title == movie.title{
                return true
            }
        }
        return false
    }
    
    func save(movie : Movie){
        coreData?.save(movietoSave: movie)
    }
    
    func delete(movie : Movie){
        coreData?.delelte(movieToDelete: movie)
    }
}
