//
//  MovieDBRequester.swift
//  MovieApp
//
//  Created by Filipe Lopes on 27/06/21.
//

import Foundation
import UIKit

enum RequestAction {
    case popular
    case topRated
    case nowPlaying
    case image
}

class MovieDBRequester {
    // ex: "https://api.themoviedb.org/3/movie/popular?api_key=5b056719de00e12af1ded70cf6060e1e&language=en-US&page=1&region=br"
    
//https://api.themoviedb.org/3/movie/3454543/images?api_key=5b056719de00e12af1ded70cf6060e1e&language=en-US
    
    private let path = "https://api.themoviedb.org/3/movie/"
    let key = "?api_key=5b056719de00e12af1ded70cf6060e1e"
    let imagePath = "https://image.tmdb.org/t/p/w300"
    var definitions = "&language=en-US&page=1&region=br"
    
    let popular = "popular"
    let top = "top_rated"
    let nowPlaying = "now_playing"
    var image = ""
    
    var urlString = ""
    
    private func changePage(number: Int) {
        self.definitions = "&language=en-US&page=\(number)&region=br"
    }
    
    private func changeImage(imgPath : String){
        self.image = imgPath
    }
    
    private func defineRequest(type: RequestAction){
        switch type {
        case .popular:
            urlString = path + popular + key + definitions
        case .topRated:
            urlString = path + top + key + definitions
        case .nowPlaying:
            urlString = path + nowPlaying + key + definitions
        case .image:
            urlString = imagePath + image
        }
    }
    
    func fetch(type: RequestAction, page: Int, completion: @escaping (Result<MoviesRO, Error>) -> ()){
        self.changePage(number: page)
        self.defineRequest(type: type)
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url){ (data, response, error) in
            if let error = error{
                completion(.failure(error))
                return
            }
            do{
                let myResponse = try JSONDecoder().decode(MoviesRO.self, from: data!)
                completion(.success(myResponse))
            }catch(let error){
                completion(.failure(error))
            }
            
        }.resume()
    }
    
    func fetchNowPlaying(type: RequestAction, page: Int, completion: @escaping (Result <NowPlayingRO, Error>) -> ()){
        self.changePage(number: page)
        self.defineRequest(type: type)
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url){ (data, response, error) in
            if let error = error{
                completion(.failure(error))
                return
            }
            do{
                let myResponse = try JSONDecoder().decode(NowPlayingRO.self, from: data!)
                completion(.success(myResponse))
            }catch(let error){
                completion(.failure(error))
            }
            
        }.resume()
    }
    
    func fetchImage(type: RequestAction, imagePath: String, completion: @escaping (Result <UIImage, Error>) -> ()){
        self.changeImage(imgPath: imagePath)
        self.defineRequest(type: type)
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url){ (data, response, error) in
            if let error = error{
                completion(.failure(error))
                return
            }
            do{
                let imageResponse = UIImage(data: data!)
                completion(.success(imageResponse!))
            }catch(let error){
                completion(.failure(error))
            }
            
        }.resume()
    }
    
}
