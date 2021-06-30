//
//  ExploreMainView.swift
//  MovieApp
//
//  Created by Filipe Lopes on 27/06/21.
//

import Foundation
import UIKit

class ExploreMainView {
    
    private var parentView = UIView()
    private let searchView = SearchView()
    private let moviesCV : UICollectionView
    
    let moviesCVCName = "Popular Movies Cell"
    let headerCVName = "Movies Header"
    
    private let titleLabel : UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.titleFont
        label.font = UIFont.boldSystemFont(ofSize: 34)
        label.text = "Explore"
        return label
    }()
    
    init(size: CGFloat) {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: size, height: 200)
        
        moviesCV = UICollectionView(frame: .zero, collectionViewLayout: layout)
        moviesCV.backgroundColor = .white
    }
    
    public func setUp(parent: UIViewController){
        self.parentView = parent.view
        self.parentView.backgroundColor = .white
        
        self.moviesCV.delegate = parent as? UICollectionViewDelegate
        self.moviesCV.dataSource = parent as? UICollectionViewDataSource
        self.moviesCV.register(MoviesCVC.self, forCellWithReuseIdentifier: moviesCVCName)
        self.moviesCV.register(MoviesCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerCVName)
        
        self.setupLayout()
    }
    
    private func setupLayout(){
        parentView.addSubview(titleLabel)
        parentView.addSubview(searchView)
        parentView.addSubview(moviesCV)
        self.anchorViews()
    }
    
    private func anchorViews(){
        self.titleLabel.anchor(top: parentView.safeAreaLayoutGuide.topAnchor, left: parentView.safeAreaLayoutGuide.leftAnchor, paddingTop: 41, paddingLeft: 24, width: 300)
        self.searchView.anchor(top: titleLabel.bottomAnchor, left: parentView.safeAreaLayoutGuide.leftAnchor, right: parentView.safeAreaLayoutGuide.rightAnchor, paddingTop: 15, paddingLeft: 24, paddingRight: 24, height: 36)
        
        self.moviesCV.anchor(top: searchView.bottomAnchor, left: parentView.safeAreaLayoutGuide.leftAnchor, bottom: parentView.safeAreaLayoutGuide.bottomAnchor, right: parentView.safeAreaLayoutGuide.rightAnchor, paddingTop: 15, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
    }
}

extension ExploreMainView : NotifyDelegate{
    func notify() {
        self.moviesCV.reloadData()
    }
}
