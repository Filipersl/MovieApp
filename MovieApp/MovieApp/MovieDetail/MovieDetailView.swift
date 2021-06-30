//
//  MovieDetailView.swift
//  MovieApp
//
//  Created by Filipe Lopes on 29/06/21.
//

import Foundation
import UIKit

class MovieDetailView {
    var movie : Movie?
    private var favorited = ButtonState.unfavoited
    private var parentView = UIView()
    private let titleLabel : UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.titleFont
        label.font = UIFont.boldSystemFont(ofSize: 34)
        label.text = ""
        return label
    }()
    private var image = UIImageView()
    private var dateLabel : UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.subTitle
        label.text = ""
        return label
    }()
    private let descriptionLabel : UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.subTitle
        label.text = ""
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    private let favButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "star"), for: .normal)
        return button
    }()
    private var delegate : ButtonDelegate?
    
    public func setUp(parent: UIViewController){
        self.parentView = parent.view
        self.parentView.backgroundColor = .white
        self.setupLayout()
        self.titleLabel.text = movie?.title
        self.image.image = movie?.image
        self.descriptionLabel.text = movie?.description
        self.dateLabel.text = movie?.date
        self.changeButton()
        self.favButton.addTarget(self, action: #selector(buttonClicked(_:)), for: .touchUpInside)
        self.delegate = parent as! ButtonDelegate
    }
    
    private func setupLayout(){
        parentView.addSubview(titleLabel)
        parentView.addSubview(image)
        parentView.addSubview(descriptionLabel)
        parentView.addSubview(dateLabel)
        parentView.addSubview(favButton)
        
        self.anchorViews()
    }
    
    private func anchorViews(){
        self.titleLabel.anchor(top: parentView.safeAreaLayoutGuide.topAnchor, left: parentView.safeAreaLayoutGuide.leftAnchor, paddingTop: 41, paddingLeft: 24, width: 300)
        self.image.anchor(top: titleLabel.bottomAnchor, left: parentView.safeAreaLayoutGuide.leftAnchor, right: parentView.safeAreaLayoutGuide.rightAnchor, paddingTop: 15, paddingLeft: 0, paddingRight: 0, height: 200)
        self.dateLabel.anchor(top: image.bottomAnchor, left: parentView.safeAreaLayoutGuide.leftAnchor, paddingTop: 15, paddingLeft: 24, width: 200)
        self.favButton.anchor(top: image.bottomAnchor, right: parentView.safeAreaLayoutGuide.rightAnchor, paddingTop: 15, paddingRight: 24, width: 50, height: 50)
        self.descriptionLabel.anchor(top: dateLabel.bottomAnchor, left: parentView.safeAreaLayoutGuide.leftAnchor, bottom: parentView.safeAreaLayoutGuide.bottomAnchor,right: parentView.safeAreaLayoutGuide.rightAnchor, paddingTop: 15, paddingLeft: 24, paddingBottom: 15, paddingRight: 24)
    }
    
    func changeButton(){
        if self.favorited == .favorited{
            self.favButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
            self.favorited = .unfavoited
        }else{
            self.favButton.setImage(UIImage(systemName: "star"), for: .normal)
            self.favorited = .favorited
        }
    }
    
    @objc func buttonClicked(_: Any){
        delegate?.tapped(state: self.favorited)
        self.changeButton()
    }
}

