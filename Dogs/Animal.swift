//
//  Animal.swift
//  Dogs
//
//  Created by Kenneth Debruyn on 4/02/17.
//  Copyright © 2017 kN3TT3R. All rights reserved.
//

import Foundation
import UIKit

struct Animal {
    var animalID: Int?
    var name = String()
    var birthPlace = String()
    var breed = String()
    var age = 0
    var description = String()
    
    func getAnimalID(for: Animal) -> Int {
        return self.animalID!
    }
}
