//
//  Team.swift
//  Automobili2
//
//  Created by Pejo on 7/9/19.
//  Copyright © 2019 pejo015. All rights reserved.
//

import UIKit

class Car {
    
    var name: String?
    var price: Double?
    var age: Int?
    var model: String?
    var image: UIImage?

    
    init(name:String?, price:Double?, age:Int?, model:String?, imageName:String?) {
            self.name = name
            self.price = price
            self.age = age
            self.model = model
        self.image = UIImage(named: imageName ?? "")
        
    }
    
}
