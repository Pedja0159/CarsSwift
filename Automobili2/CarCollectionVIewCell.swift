//
//  CarClass.swift
//  Automobili2
//
//  Created by Pejo on 7/11/19.
//  Copyright © 2019 pejo015. All rights reserved.
//

import UIKit

class CarCollectionViewCell: UICollectionViewCell {
    
        
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
            
            
            carImageView.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 10, paddingLeft: 10, paddingBottom: 0, paddingRight: 10, width: 0, height: 50)
            
            carNameLabel.anchor(top: carImageView.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
       
    
                }
    
        }
