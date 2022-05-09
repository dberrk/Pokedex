//
//  ViewController.swift
//  testCollectionView
//
//  Created by Berk Macbook on 21.03.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var pokemons = [Pokemon]()
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        load()
       
        
    }
    
    func load() {
        Service.shared.fetchPokemon { (pokemon) in
            DispatchQueue.main.async {
                self.pokemons = pokemon
                self.collectionView.reloadData()
            }
        }
    }
    
   
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "pokedexDetail" {
            if let pokemon = sender as? Pokemon {
                
                let toVC = segue.destination as! PokedexDetailViewController
                toVC.pokemon = pokemon
                
                
            }
        }
    }
}



extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource  {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "pokedexCell", for: indexPath) as! CollectionViewPokedex
        
        cell.pokemons = pokemons[indexPath.row]
        cell.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor

        cell.layer.cornerRadius = 8

        cell.layer.borderWidth = 1

        cell.layer.borderColor = UIColor(red: 0.455, green: 0.796, blue: 0.282, alpha: 1).cgColor
        return cell
    }
    
   
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let pokemon = pokemons[indexPath.row]
        performSegue(withIdentifier: "pokedexDetail", sender: pokemon)
        
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pokemons.count
    }
    
}




