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
    var dog = Animal()
    var image = UIImage()
    
    
    //  MARK: - Overridden Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = dog.name
        self.animalAgeLabel.text = "\(dog.age) years"
        self.animalBreedLabel.text = dog.breed
        self.animalBirthplaceLabel.text = dog.birthPlace
        self.animalImageView.image = image
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
