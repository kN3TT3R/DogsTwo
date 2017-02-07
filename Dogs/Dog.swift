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
    var name: String
    var birthPlace: String?
    var breed: String?
    var age: Int?
    var photo: UIImage?
    
    init?(name: String, birthPlace: String?, breed: String?, age: Int?, photo: UIImage?) {
        
        // The name must not be empty
        guard !name.isEmpty else {
            return nil
        }
        
        // Initialize stored properties.
        self.name = name
        self.birthPlace = birthPlace
        self.breed = breed
        self.age = age
        self.photo = photo
    }
    
}
