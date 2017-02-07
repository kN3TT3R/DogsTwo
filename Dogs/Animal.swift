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
    var animalID: Int?
    var name = String()
    var birthPlace = String()
    var breed = String()
    var age = 0
    
    
    func getAnimalID(for: Animal) -> Int {
        return self.animalID!
    }
    
}
