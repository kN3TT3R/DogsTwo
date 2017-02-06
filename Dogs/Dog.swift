//
//  Dog.swift
//  Dogs
//
//  Created by Kenneth Debruyn on 7/02/17.
//  Copyright © 2017 kN3TT3R. All rights reserved.
//


import UIKit


class Dog {
    
    // MARK: - Properties
    var animalID: Int?
    var name = String()
    var birthPlace = String()
    var breed = String()
    var age = Int()
    var photo: UIImage?
    
    init?(animalID: Int?, name: String, birthPlace: String, breed: String, age: Int, photo: UIImage?) {
        
        //        // Initialization should fail if there is no name or if the rating is negative.
        //        if name.isEmpty || rating < 0  {
        //            return nil
        //        }
        
        // The name must not be empty
        guard !name.isEmpty else {
            return nil
        }
        
        // Initialize stored properties.
        self.animalID = animalID
        self.name = name
        self.birthPlace = birthPlace
        self.breed = breed
        self.age = age
        self.photo = photo
    }
    
}
