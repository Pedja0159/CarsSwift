//
//  InfoView.swift
//  Automobili2
//
//  Created by Pejo on 25/11/2019.
//  Copyright © 2019 pejo015. All rights reserved.
//

import UIKit

private let reuseIdentifier = "carStatCell"

class InfoView: UIView {
    
    
    //        didSet {
    //            guard let car = car else { return }
    //            guard let baseExperience = car.baseExperience else { return }
    //            carNameView.text = car.name?.capitalized
    //            carImageView?.image = car.image
    //            //                            self.tableView.reloadData()
    //
    //            if car.id < 151 {
    //                originalcarLabel.text = "Original Car: Yes"
    //
    //            }else {
    //                originalcarLabel.text = "Original Car: No"
    //            }
    //            if baseExperience <= 100 {
    //                baseExperienceLabel.text = "Strength: Low"
    //            } else if baseExperience <= 150 {
    //                baseExperienceLabel.text = "Strength: Medium"
    //            } else {
    //                baseExperienceLabel.text = "Strength: High"
    //            }
    //        }
    //
    //    }
    
    
   var carViewModel: CarViewModel?
//        didSet {
//            guard let carViewModel = carViewModel else { return }
//            carImageView.image = carViewModel.image
//            originalcarLabel.text = carViewModel.originalcarLabel
//            baseExperienceLabel.text = carViewModel.baseExperienceLabel
//            collectionView.reloadData()
//        }
//    }
    
    var delegate: CarCellDelegate?
    var collectionView: UICollectionView!
     
     let carImageView: UIImageView = {
         let iv = UIImageView()
         iv.contentMode = .scaleAspectFit
         return iv
         
     }()
    
    
    let baseExperienceLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .center
        return label
    }()
    
    
    let originalcarLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .center
        return label
    }()
    
    let infoButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .white
        button.setTitle("View More Info", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.addTarget(self, action: #selector(handleViewMoreInfo), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 5
        return button
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureViewComponents()
    }
    
    // MARK: - Selectors
    
    @objc func handleViewMoreInfo() {
        guard let carViewModel = self.carViewModel else { return }
        delegate?.viewMoreInfo(withViewModel: carViewModel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Helper Functions
    
    func configureViewComponents() {
        backgroundColor = .white
        
        self.layer.masksToBounds = true
        
     
        configureTableView()
        
        addSubview(originalcarLabel)
        originalcarLabel.anchor(top: collectionView.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 20, paddingLeft: 16, paddingBottom: 0, paddingRight: 16, width: 0, height: 0)
        
        addSubview(baseExperienceLabel)
        baseExperienceLabel.anchor(top: originalcarLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 4, paddingLeft: 16, paddingBottom: 0, paddingRight: 16, width: 0, height: 0)
        
        addSubview(infoButton)
        infoButton.anchor(top: nil, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 12, paddingBottom: 12, paddingRight: 12, width: 0, height: 50)
    }
}

extension InfoView: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func configureTableView() {
        collectionView = UICollectionView()
        collectionView.isScrollEnabled = false
        collectionView.delegate = self
        collectionView.dataSource = self
        
        
        let nib = UINib(nibName: "carStatCell", bundle: nil)
        collectionView?.register(nib, forCellWithReuseIdentifier: "carStatCell")
        
        addSubview(collectionView)
        collectionView.anchor(top: carImageView.bottomAnchor, left: nil, bottom: nil, right: nil, paddingTop: 16, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 200, height: 200)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return CarStats.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CarCollectionViewCell
        cell.carViewModel = self.carViewModel
        cell.titleLabel.text = CarStats(rawValue: indexPath.row)?.description
        cell.configureCell(withIndex: indexPath.row)
        return cell
    }
    
    
}








