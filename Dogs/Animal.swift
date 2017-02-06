//
//  Animal.swift
//  Dogs
//
//  Created by Kenneth Debruyn on 4/02/17.
//  Copyright © 2017 kN3TT3R. All rights reserved.
//


import UIKit


struct Animal {
    
    
    
    //MARK: Properties
    
    var animalID = Int()
    var name: String
    var birthPlace: String
    var breed: String
    var age: Int
    var photo: UIImage?
    //var description = String()
    
    
    
    // Initialization should fail if there is no name or if the rating is negative.
    

    
    //MARK: Initialization
    
//    init?(animalID: Int, name: String, birthPlace: String, breed: String, age: Int, photo: UIImage?) {
//        
//        
//        if (name.isEmpty || birthPlace.isEmpty || breed.isEmpty || age.description.isEmpty) {
//            return nil
//        }
//
//        self.animalID = animalID
//        self.name = name
//        self.birthPlace = birthPlace
//        self.breed = breed
//        self.age = age
//        self.photo = photo
//    }
    

    
    func getAnimalID(for: Animal) -> Int {
        return (self.animalID)
    }
    
}
