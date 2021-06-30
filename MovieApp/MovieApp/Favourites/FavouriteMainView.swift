//
//  FavouriteMainView.swift
//  MovieApp
//
//  Created by Filipe Lopes on 27/06/21.
//

import Foundation
import UIKit

class FavouriteMainView {
    private var parentView = UIView()
    let moviesCVCName = "Fav Movies Cell"
    private let titleLabel : UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.titleFont
        label.font = UIFont.boldSystemFont(ofSize: 34)
        label.text = "Favourite"
        return label
    }()
    private let adviceLabel : UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.subTitle
        label.text = "You don't have favorited movies yet. Go to Explore and save a movie by clicking on the Star icon."
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    private let collectionView : UICollectionView
    
    init(width: CGFloat) {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: width, height: 200)
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
    }
    
    public func setUp(parent: UIViewController){
        self.parentView = parent.view
        self.parentView.backgroundColor = .white
        self.collectionView.delegate = parent as? UICollectionViewDelegate
        self.collectionView.dataSource = parent as? UICollectionViewDataSource
        self.collectionView.register(MoviesCVC.self, forCellWithReuseIdentifier: moviesCVCName)
        self.setupLayout()
    }
    public func reloadCV(){
        self.collectionView.reloadData()
    }
    private func setupLayout(){
        parentView.addSubview(titleLabel)
        parentView.addSubview(adviceLabel)
        parentView.addSubview(collectionView)
        
        self.anchorViews()
    }
    
    private func anchorViews(){
        self.titleLabel.anchor(top: parentView.safeAreaLayoutGuide.topAnchor, left: parentView.safeAreaLayoutGuide.leftAnchor, paddingTop: 41, paddingLeft: 24, width: 300)
        self.adviceLabel.anchor(top: titleLabel.bottomAnchor, left: parentView.safeAreaLayoutGuide.leftAnchor, right: parentView.safeAreaLayoutGuide.rightAnchor, paddingTop: 30, paddingLeft: 24, paddingRight: 24, height: 300)
        self.collectionView.anchor(top: titleLabel.bottomAnchor, left: parentView.safeAreaLayoutGuide.leftAnchor, bottom: parentView.safeAreaLayoutGuide.bottomAnchor, right: parentView.safeAreaLayoutGuide.rightAnchor, paddingTop: 15)
    }
    func clearCV(){
        self.collectionView.backgroundColor = .clear
    }
}
