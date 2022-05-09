//
//  APICaller.swift
//  testCollectionView
//
//  Created by Berk Macbook on 22.03.2022.
//

import Foundation
import UIKit


class Service {
    static let shared = Service()
    let url = "https://pokedex-bb36f.firebaseio.com/pokemon.json"
    
    
    
    func fetchPokemon(completion: @escaping ([Pokemon]) -> ()) {
        var pokemonArray = [Pokemon]()
        guard let url = URL(string: url) else {return}
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            // handle error
            
            if let error = error {
                print("Hata: \(error.localizedDescription)")
                return
            }
            
            guard let data = data else {
                return
            }
            
            do {
                guard let resultArray = try JSONSerialization.jsonObject(with: data, options: []) as? [AnyObject] else {return}
                for (key, result) in resultArray.enumerated(){
                    if let dictionary = result as? [String: AnyObject] {
                        var pokemon = Pokemon(id: key, dictionary: dictionary)
                        
                        guard let imageUrl = pokemon.imageUrl else {return}
                        self.fetchImage(withuUrlString: imageUrl) { image in
                            pokemon.image = image
                            pokemonArray.append(pokemon)
                            
                            pokemonArray.sort { (poke1, poke2) -> Bool in
                                return poke1.id! < poke2.id!
                            }
                            completion(pokemonArray)
                            
                        }
                        
                        
                    }
                    
                }
            } catch let error {
                print("Failed to create json with error: \(error.localizedDescription)")
            }

        }.resume()
    }
    
    
    private func fetchImage(withuUrlString urlString: String, completion: @escaping(UIImage)-> ()) {
        
        guard let url = URL(string: urlString) else {return}
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Img Hata: \(error.localizedDescription)")
                return
            }
            
            guard let data = data else {
                return
            }
            guard let image = UIImage(data: data) else {return}
            
            completion(image)
        }.resume()
    }
}

















/*
struct APIResult:Decodable {
    let next: String
    let results: [APIPokemon]
}
struct APIPokemon:Decodable {
    let name: String
    let url: String
}

struct APIPokemonResult:Decodable{
    let name: String
    let id: Int
    let species: APISpecies
    let sprites: APISprite
    let height: Int
    let weight: Int
    let stats: [APIStats]
}

struct APISpecies:Decodable {
    let name: String
}
struct APISprite:Decodable {
    let frontDefault: String
}
struct APIStats:Decodable{
    let baseStat: Int
}



class PokedexManager {
    let decoder: JSONDecoder!
    let pokedexURL = "https://pokeapi.co/api/v2/"
    var next: String?
    var pokemon = [Pokemon]()
    var isInPaginationState = false
    var fetchedPokemons = [Pokemon]()
    
    init() {
        next = "https://pokeapi.co/api/v2/pokemon?offset=0&limit=50"
        decoder = JSONDecoder()
    }
    
    func fetchPokemons(pagination: Bool, completion: @escaping (Result<Any,Error>)-> Void){
            fetchedPokemons.removeAll()
            if pagination{
                isInPaginationState = true
            }
            if let url = URL(string: pokedexURL){
                URLSession.shared.dataTask(with: url, completionHandler: {data,_,error in
                    guard error == nil, let data = data else{
                        if let error = error {
                            print("Error found while fetching pokemon list \(error.localizedDescription)")
                        }
                        return
                    }
                    do{
                        let result = try self.decoder.decode(APIResult.self, from: data)
                        self.next = result.next
                        for pokemon in result.results{
                            //fetch each pokemon to get more info about them
                            self.fetchPokemon(url: pokemon.url, completion: completion)
                            
                        }
                        completion(.success(self.fetchedPokemons))
                        if pagination {
                            self.isInPaginationState = false
                        }
                        
                    }
                    catch let error{
                        print("Error fetching pokemon list: \(error.localizedDescription)")
                        completion(.failure(error))
                    }
                }).resume()
            }
        }
    
    func fetchPokemon(url: String, completion: @escaping(Result<Any,Error>)->Void) {
        if let url = URL(string: url){
            URLSession.shared.dataTask(with: url, completionHandler: {data,_, error in
                guard error == nil, let data = data else {
                    if let error = error {
                        print("Error found while fetching pokemon list \(error.localizedDescription)")
                    }
                    return }
                do {
                    let fetchedPokemon = try self.decoder.decode(APIPokemonResult.self, from: data)
                    
                    // fetch picture
                    self.fetchImage(index: self.fetchedPokemons.count, url: fetchedPokemon.sprites.frontDefault, completion: completion)
                    let dic = ["imageUrl": fetchedPokemon.sprites.frontDefault, "species": fetchedPokemon.species.name, "name": fetchedPokemon.name, "weight": fetchedPokemon.weight, "height": fetchedPokemon.height] as [String : Any]
                    let pokemon = Pokemon(id: fetchedPokemon.id, dictionary: dic)
                    self.pokemon.append(pokemon)
                    self.fetchedPokemons.append(pokemon)
                    completion(.success([pokemon]))
                } catch let error {
                    completion(.failure(error))
                    print("Error fetching pokemon list: \(error.localizedDescription)")
                }
                
            }).resume()
        }
    }
        
    
    func fetchImage(index: Int, url: String, completion: @escaping(Result<Any,Error>)-> Void){
        if let url = URL(string: url){
            URLSession.shared.dataTask(with: url) { data, _, error in
                guard error == nil, let data = data else {return}
                DispatchQueue.main.async {
                    if let img = UIImage(data: data){
                        if index <= self.fetchedPokemons.count{
                            self.fetchedPokemons[index].image = img
                            completion(.success(img))
                        }
                    }else{
                        if index <= self.fetchedPokemons.count {
                            self.fetchedPokemons[index].image = UIImage()
                            completion(.success(UIImage()))
                        }
                    }
                }
            }.resume()
        }
    }
        
        
        
        
    }
    */
    
    



