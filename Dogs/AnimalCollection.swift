//
//  AnimalCollection.swift
//  Dogs
//
//  Created by Kenneth Debruyn on 4/02/17.
//  Copyright © 2017 kN3TT3R. All rights reserved.
//


import Foundation


struct AnimalCollection {
    let collection = [
        Animal(animalID: 0, name: "Chuck", birthPlace: "Place 1", breed: "Breed 1", age: 2, description: "Description 1"),
        Animal(animalID: 1, name: "Wobbes", birthPlace: "Place 2", breed: "Breed 2", age: 4, description: "Description 2"),
        Animal(animalID: 2, name: "Wimpie", birthPlace: "Place 3", breed: "Breed 3", age: 6, description: "Description 3"),
        Animal(animalID: 3, name: "Happy", birthPlace: "Place 4", breed: "Breed 4", age: 8, description: "Description 4")
    ]
    
    func getAnimal(with dogID: Int) -> Animal {
        return collection[dogID]
    }
    
    func getNextAnimal(for dogID: Int) -> Animal {
        
        var dogID = dogID
        
        if (collection[dogID].animalID == collection.count - 1) {
            dogID = 0
            return getAnimal(with: dogID)
        } else {
            dogID += 1
            return getAnimal(with: dogID)
        }
    }
    
    func getPreviousAnimal(for dogID: Int) -> Animal {
        
        var dogID = dogID
        
        if (collection[dogID].animalID == 0) {
            dogID = collection.count - 1
            return getAnimal(with: dogID)
        } else {
            dogID -= 1
            return getAnimal(with: dogID)
        }
    }
}


