//
//  MoviesCollectionReusableView.swift
//  MovieApp
//
//  Created by Filipe Lopes on 27/06/21.
//

import Foundation
import UIKit

class MoviesCollectionReusableView: UICollectionReusableView {
    
    private let label : UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.subTitle
        return label
    }()
    
    func setup(text: String){
        self.label.text = text
        self.backgroundColor = .white
        addSubview(label)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = bounds
    }
}

