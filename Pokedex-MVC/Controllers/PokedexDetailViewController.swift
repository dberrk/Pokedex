//
//  PokedexDetailViewController.swift
//  testCollectionView
//
//  Created by Berk Macbook on 23.03.2022.
//

import UIKit

class PokedexDetailViewController: UIViewController {
    
    var pokemon: Pokemon?
    
    @IBOutlet weak var viewPokedex: UIView!
    @IBOutlet weak var pokemonImage: UIImageView!
    @IBOutlet weak var pokemonNameLabel: UILabel!
    @IBOutlet weak var pokemonIdLabel: UILabel!
    @IBOutlet weak var pokemonTypeLabel: UILabel!
    @IBOutlet weak var pokemonAboutLabel: UILabel!
    @IBOutlet weak var pokemonWeightLabel: UILabel!
    @IBOutlet weak var pokemonHeightLabel: UILabel!
    @IBOutlet weak var pokemonMovesLabel: UILabel!
    @IBOutlet weak var pokemonDescLabel: UILabel!
    @IBOutlet weak var pokemonHpLabel: UILabel!
    @IBOutlet weak var pokemonAtkLabel: UILabel!
    @IBOutlet weak var pokemonDefLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        viewPokedex.layer.cornerRadius = 8
        pokemonTypeLabel.layer.cornerRadius = 10
        
        
        
    }
    

    func setupUI() {
        
        pokemonNameLabel.text = pokemon?.name?.capitalized
        pokemonImage.image = pokemon?.image
        pokemonIdLabel.text = ("# \(pokemon?.id ?? 0)")
        pokemonTypeLabel.text = pokemon?.typePokemon
        pokemonWeightLabel.text = ("\(pokemon?.weight ?? 0)")
        pokemonHeightLabel.text = ("\(pokemon?.height ?? 0)")
        pokemonDescLabel.text = pokemon?.description
        pokemonAtkLabel.text = ("0\(pokemon?.attack ?? 0)")
        pokemonDefLabel.text = ("0\(pokemon?.defense ?? 0)")
        
       
    }
   
    
 
}
