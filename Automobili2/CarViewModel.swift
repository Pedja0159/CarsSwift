//
//  CarViewModel.swift
//  Automobili2
//
//  Created by Pejo on 25/11/2019.
//  Copyright © 2019 pejo015. All rights reserved.
//
import Foundation
import UIKit


struct CarViewModel {
 
    var name: String!
    var image: UIImage!
    var originalcarLabel: String!
    var baseExperienceLabel: String!
    var id: Int!
    var weight: Int?
    var height: Int?
    var type: String?
    
    init(car: Car) {
        self.name = car.name
       guard let image = car.image else { return }
//       guard let baseExperience = car.baseExperience else { return }
       self.image = image
       
//       if car.id < 151 {
                originalcarLabel = "Original Car: Yes"
               
           }else {
               originalcarLabel = "Original Car: No"
           }
           if baseExperience <= 100 {
               baseExperienceLabel = "Strength: Low"
           } else if baseExperience <= 150 {
               baseExperienceLabel = "Strength: Medium"
           } else {
               baseExperienceLabel = "Strength: High"
           }
       }
    }

