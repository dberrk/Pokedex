//
//  PokemonModel.swift
//  testCollectionView
//
//  Created by Berk Macbook on 22.03.2022.
//

import Foundation
import UIKit

struct Pokemon{
    
    var name: String?
    var imageUrl: String?
    var image: UIImage?
    var id: Int?
    var weight: Int?
    var height: Int?
    var defense: Int?
    var description: String?
    var typePokemon: String?
    var attack: Int?
    var baseExperience: Int?
    
    
    
    
    
    init(id: Int, dictionary: [String:Any]) {
        
        self.id = id
        
        if let name = dictionary["name"] as? String {
            self.name = name
        }
        
        if let imageUrl = dictionary["imageUrl"] as? String {
            self.imageUrl = imageUrl
        }
        
        if let image = dictionary["image"] as? UIImage {
            self.image = image
        }
        
        if let weight = dictionary["weight"] as? Int {
            self.weight = weight
        }
        if let type = dictionary["type"] as? String {
            self.typePokemon = type
        }
        if let height = dictionary["height"] as? Int {
            self.height = height
        }
        if let defense = dictionary["defense"] as? Int {
            self.defense = defense
        }
        if let attack = dictionary["attack"] as? Int {
            self.attack = attack
        }
        if let description = dictionary["description"] as? String {
            self.description = description
        }
        
        
    }
    
    

}





extension Pokemon {
    var typeColor: UIColor {
        get {
            switch typePokemon {
            case "fire": return .systemRed
            case "poision": return .systemGreen
            case "water": return .systemBlue
            case "electric": return .systemYellow
            case "psychic": return .systemPurple
            case "normal": return .systemOrange
            case "ground": return .systemGray
            case "flying": return .systemTeal
            case "fairy": return .systemPink
            default: return .systemIndigo
            }
        }
    }

}
