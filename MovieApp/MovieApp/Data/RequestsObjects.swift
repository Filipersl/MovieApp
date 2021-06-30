//
//  RequestsObjects.swift
//  MovieApp
//
//  Created by Filipe Lopes on 27/06/21.
//

import Foundation
import UIKit

struct MoviesRO : Decodable {
    let page : Int
    let results : [MovieDetailRO]
}

struct NowPlayingRO : Decodable {
    let dates : NPDates
    let page : Int
    let results : [MovieDetailRO]
}

struct NPDates : Decodable{
    let maximum : String
    let minimum : String
}

struct MovieDetailRO : Decodable {
    let adult : Bool
    let backdrop_path : String?
    let genre_ids : [Int]
    let id : Int
    let original_language : String
    let original_title : String
    let overview: String
    let popularity : Float
    let poster_path : String? 
    let release_date : String
    let title : String
    let video : Bool
    let vote_average : Float
    let vote_count : Int
}

