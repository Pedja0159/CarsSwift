//
//  CarClass.swift
//  Cars
//
//  Created by Pejo on 7/11/19.
//  Copyright © 2019 pejo015. All rights reserved.
//

import UIKit

class CarCollectionViewCell: UICollectionViewCell {
    
    weak var manageCarsDelegate: ManageCarsDelegate?
    
    
    @objc fileprivate func deleteButtonTapped() {
        
        if let _car = car {
            manageCarsDelegate?.didRemoveCar?(car: _car)
            
        }
        
    }
    
    
    
    
    let deleteButton: UIButton = {
        let button = UIButton ()
        button.translatesAutoresizingMaskIntoConstraints = false
        let trashImage = UIImage(named: "trashIcon")
        button.setImage(trashImage, for: .normal)
        return button
    }()
    
    
    
    var car: Car? {
        
        
        didSet {
            carImageView.image = car?.image
            carNameLabel.text = car?.name
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        setCellShadow()
    }
    let carImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        return iv
        
    }()
    
    let carNameLabel: UILabel = {
        
        let label = UILabel()
        label.text = "Name"
        label.textColor = UIColor.white
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .center
        return label
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        self.backgroundColor = UIColor.customDarkBlueColor
        
        self.addSubview(carImageView)
        self.addSubview(carNameLabel)
        self.addSubview(deleteButton)
        deleteButton.addTarget(self, action: #selector(deleteButtonTapped), for: .touchUpInside)
        
        carImageView.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 10, paddingLeft: 10, paddingBottom: 0, paddingRight: 10, width: 0, height: 50)
        
        carNameLabel.anchor(top: carImageView.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
        
        
        
        let heightDeleteButtonAnchor = deleteButton.heightAnchor.constraint(equalToConstant: 22)
        let widthDeleteButtonAnchor = deleteButton.widthAnchor.constraint(equalToConstant: 22)
        let rightDeleteButtonAnchor = deleteButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0)
        let bottomDeleteButtonAnchor = deleteButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0)
        
        NSLayoutConstraint.activate([heightDeleteButtonAnchor,widthDeleteButtonAnchor,rightDeleteButtonAnchor,bottomDeleteButtonAnchor])
        
        
        
    }
    
}
