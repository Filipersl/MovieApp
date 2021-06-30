//
//  SearchView.swift
//  MovieApp
//
//  Created by Filipe Lopes on 27/06/21.
//

import Foundation
import UIKit

class SearchView: UIView {
    private let textField : UITextField = {
        let tf = UITextField()
        tf.font = UIFont.searchFont
        tf.placeholder = "Enter the movie name"
        tf.textColor = .white
        return tf
    }()
    private let icon = UIImageView(image: UIImage(systemName: "text.magnifyingglass"))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setup(){
        
        self.layer.cornerRadius = 10
        self.backgroundColor = .gray
        
        addSubview(self.textField)
        addSubview(self.icon)
        
        self.icon.anchor(top: self.topAnchor, left: self.leftAnchor, bottom: self.bottomAnchor, paddingTop: 3, paddingLeft: 10, paddingBottom: 3, width: 30)
        self.textField.anchor(top: self.topAnchor, left: icon.rightAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, paddingTop: 3, paddingLeft: 10, paddingBottom: 3, paddingRight: 10)
    }
}
