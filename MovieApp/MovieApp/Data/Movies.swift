//
//  Movies.swift
//  MovieApp
//
//  Created by Filipe Lopes on 27/06/21.
//

import Foundation
import UIKit

class Movie{
    let title : String
    let image : UIImage
    let description : String
    let date : String
    
    init(title: String, image: UIImage, description: String, date: String) {
        self.title = title
        self.image = image
        self.description = description
        self.date = date
    }
}


struct AllMovies {
    static let movies = [
        Movie(title: "Filme", image: UIImage(), description: "Descrição", date: "2001"),
        Movie(title: "Filme2", image: UIImage(), description: "Descrição2", date: "2002"),
        Movie(title: "Filme3", image: UIImage(), description: "Descrição3", date: "2003"),
        Movie(title: "Filme4", image: UIImage(), description: "Descrição4", date: "2004")
    ]
}
