//
//  DetailViewController.swift
//  Automobili2
//
//  Created by Pejo on 7/29/19.
//  Copyright © 2019 pejo015. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    
    var carImageView : UIImageView?
    
    var car: Car?
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        carImageView = UIImageView(frame: CGRect(x: 0, y: 20, width: 400, height: 400))
        carImageView?.image = car?.image
        carImageView?.backgroundColor = .white
        self.view.addSubview(carImageView!)
        
        view.backgroundColor = .customDarkBlueColor
        
        
        
    }
    
}
