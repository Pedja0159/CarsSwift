//
//  CarStat.swift
//  Automobili2
//
//  Created by Pejo on 26/11/2019.
//  Copyright © 2019 pejo015. All rights reserved.
//

import Foundation

import UIKit
enum CarStats: Int, CaseIterable {
    
    case carType
    case carxId
    case Height
    case Weight
    
    var description: String {
        switch self {
        case .carType: return "Type: "
        case .carxId: return "Pokedex ID: "
        case .Height: return "Height: "
        case .Weight: return "Weight: "
        }
    }
}

class CarStat {
    
    var name: String!
    var imageUrl: String!
    var image: UIImage?
    var infoUrl: String?
    var id: Int!
    
    var weight: Int?
    var height: Int?
    var defense: String?
    var description: String?
    var type: String?
    var baseExperience: Int?
    
    init(id: Int, name: String, image: UIImage) {
        self.id = id
        self.image = image
        self.name = name
    }
    
    func configureCarData(withDescription description: String, dictionary: [String: AnyObject]) {
        self.description = description
        
        if let weight = dictionary["weight"] as? Int {
            self.weight = weight
        }
        
        if let height = dictionary["height"] as? Int {
            self.height = height
        }
        
        if let baseExperience = dictionary["base_experience"] as? Int {
            print(baseExperience)
            self.baseExperience = baseExperience
        }
        
        if let types = dictionary["types"] as? [Dictionary<String, AnyObject>], types.count > 0 {
            guard let typeDictionary = types[0]["type"] else { return }
            guard let type = typeDictionary["name"] as? String else { return }
            self.type = type
        }
    }
}
