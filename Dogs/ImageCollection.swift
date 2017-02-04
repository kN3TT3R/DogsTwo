//
//  ImageCollection.swift
//  Dogs
//
//  Created by Kenneth Debruyn on 4/02/17.
//  Copyright © 2017 kN3TT3R. All rights reserved.
//

import Foundation
import UIKit

struct ImageCollection {
    
    let collection = [#imageLiteral(resourceName: "Chuck") , #imageLiteral(resourceName: "Happy"), #imageLiteral(resourceName: "Wobbes"), #imageLiteral(resourceName: "Wimpie")]
    
    func getImage(with dogID: Int) -> UIImage {
        return self.collection[dogID]
    }
}
