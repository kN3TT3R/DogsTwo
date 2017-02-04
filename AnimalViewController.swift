//
//  AnimalViewController.swift
//  Dogs
//
//  Created by Kenneth Debruyn on 3/02/17.
//  Copyright © 2017 kN3TT3R. All rights reserved.
//

import UIKit

class AnimalViewController: UIViewController {

    
    // MARK: - IBOutlets
    @IBOutlet weak var animalAgeLabel: UILabel!
    @IBOutlet weak var animalBreedLabel: UILabel!
    @IBOutlet weak var animalBirthplaceLabel: UILabel!
    @IBOutlet weak var animalImageView: UIImageView!

    
    // MARK: - Global Properties
    var currentDog = Animal()
    var image = UIImage()
    
    
    //  MARK: - Overridden Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = currentDog.name
        self.animalAgeLabel.text = "\(currentDog.age) years"
        self.animalBreedLabel.text = currentDog.breed
        self.animalBirthplaceLabel.text = currentDog.birthPlace
        self.animalImageView.image = image
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
