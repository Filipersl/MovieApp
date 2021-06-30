//
//  MoviesCVC.swift
//  MovieApp
//
//  Created by Filipe Lopes on 27/06/21.
//

import Foundation
import UIKit

class MoviesCVC: UICollectionViewCell {
    
    private var movie : Movie?
    private var imageView = UIImageView()
    private var nameLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.subTitle
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textColor = .black
        return label
    }()
    
    
    public func setup(movie: Movie){
        self.imageView.image = movie.image
        self.nameLabel.text = movie.title
        self.backgroundColor = .white
        self.movie = movie
        
        addSubview(imageView)
        addSubview(nameLabel)
        
        imageView.anchor(top: self.topAnchor, left: self.leftAnchor, bottom: self.bottomAnchor, paddingTop: 3, paddingLeft: 3, paddingBottom: 3, width: 200)
        
        nameLabel.anchor(top: self.topAnchor, left: imageView.rightAnchor, bottom: self.bottomAnchor , right: self.rightAnchor, paddingTop: 3, paddingLeft: 3, paddingBottom: 3, paddingRight: 3)
    }
}
