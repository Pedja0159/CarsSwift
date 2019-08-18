//
//  TeamCell.swift
//  Automobili2
//
//  Created by Pejo on 7/9/19.
//  Copyright © 2019 pejo015. All rights reserved.
//

import UIKit





class TeamCell: UICollectionViewCell{
    
    var car: Car? {
        
        didSet {
          
            
            teamImageView.image = car?.image
            teamNameLabel.text = car?.name
            
            
            
        }
        
        
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        setCellShadow()
    }
    

    
    let teamImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        return iv
        
    }()
    
    let teamNameLabel: UILabel = {
        
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
        
        self.addSubview(teamImageView)
        self.addSubview(teamNameLabel)
        
        
        teamImageView.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 10, paddingLeft: 10, paddingBottom: 0, paddingRight: 10, width: 0, height: 50)
        
        teamNameLabel.anchor(top: teamImageView.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
        
        
        
    }
    
    
    
}






