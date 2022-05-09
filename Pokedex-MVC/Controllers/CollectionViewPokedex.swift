//
//  CollectionViewPokedex.swift
//  testCollectionView
//
//  Created by Berk Macbook on 21.03.2022.
//

import UIKit

class CollectionViewPokedex: UICollectionViewCell {
    var pokemons: Pokemon? {
        didSet {
            pokedexLabel.text = pokemons?.name?.capitalized
            pokedexImage.image = pokemons?.image
            
        }
    }
    @IBOutlet weak var pokedexLabel: UILabel!
    @IBOutlet weak var pokedexImage: UIImageView!
    
    
}


