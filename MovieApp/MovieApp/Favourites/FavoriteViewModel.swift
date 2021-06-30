//
//  FavoriteViewModel.swift
//  MovieApp
//
//  Created by Filipe Lopes on 30/06/21.
//

import Foundation
import CoreData
import UIKit

class FavoriteViewModel {
    private var myMovies : [Movie] = []
    private var coreData : MoviesCoreData?

    init() {
        guard let appDelegate =
          (UIApplication.shared.delegate as? AppDelegate) else {
            
          return
        }
        coreData = MoviesCoreData(appDelegate: appDelegate)
        self.refreshData()
    }

    func getMovies()-> [Movie]{
        return myMovies
    }
    func refreshData()  {
        myMovies = (coreData?.fetch())!
    }
}


