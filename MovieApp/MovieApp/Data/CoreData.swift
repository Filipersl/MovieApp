//
//  CoreData.swift
//  MovieApp
//
//  Created by Filipe Lopes on 30/06/21.
//

import Foundation
import CoreData
import UIKit

class MoviesCoreData {
    let managedContext : NSManagedObjectContext
    static var movies = [Movie]()
      
    init(appDelegate : AppDelegate) {
        self.managedContext = appDelegate.persistentContainer.viewContext
        MoviesCoreData.movies = self.fetch()
    }
    
    func save(movietoSave: Movie) {
        
        let entity =
          NSEntityDescription.entity(forEntityName: "Filme",
                                     in: managedContext)!
        
        let movie = NSManagedObject(entity: entity,
                                     insertInto: managedContext)
    
        movie.setValue(movietoSave.title, forKeyPath: "nome")
        movie.setValue(movietoSave.date, forKey: "data")
        movie.setValue(movietoSave.description, forKey: "descricao")
        //movie.setValue(movietoSave.image, forKey: "imagem")
        
        do {
            try managedContext.save()
        } catch let error as NSError {
          print("Could not save. \(error), \(error.userInfo)")
        }
        MoviesCoreData.movies = self.fetch()
      }
    
    func fetch()-> [Movie]{
         
         let fetchRequest =
           NSFetchRequest<NSManagedObject>(entityName: "Filme")
         var listMovie = [Movie]()
        
         do {
            let movies =  try managedContext.fetch(fetchRequest)
            for movie in movies{
                let title = movie.value(forKeyPath: "nome") as? String
//                let image = movie.value(forKeyPath: "imagem") as? UIImage
                let image = UIImage(systemName: "star")
                let description = movie.value(forKeyPath: "descricao") as? String
                let date = movie.value(forKeyPath: "data") as? String
                let fetchMovie = Movie(title: title!, image: image!, description: description!, date: date!)
                listMovie.append(fetchMovie)
            }
            return listMovie
         } catch let error as NSError {
           print("Could not fetch. \(error), \(error.userInfo)")
         }
        return [Movie]()
    }
    
    func delelte(movieToDelete : Movie){
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest.init(entityName: "Filme")
         
        fetchRequest.predicate = NSPredicate(format: "nome = %@", movieToDelete.title)
        
        do{
            let requestObject = try managedContext.fetch(fetchRequest)
            let movie = requestObject[0] as! NSManagedObject

            managedContext.delete(movie)
            MoviesCoreData.movies = self.fetch()
            
        }catch let error as NSError{
            print("Deu erro no delete: \(error)")
        }
    }
}
