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
    @IBOutlet weak var animalNameLabel: UILabel!
    @IBOutlet weak var animalAgeLabel: UILabel!
    @IBOutlet weak var animalBreedLabel: UILabel!
    
    @IBOutlet weak var animalImageView: UIImageView!
    
    
    // MARK: - Global Variables
    /* 
        We need to create the initial data for the first animal to be displayed.
        -> create a variable for animalInformation (Tuple)
                because in ViewController we use a Dictionary of Tuples containing animals:
                let dogInfoDictionary = ["Chuck": (birthPlace: "Torhout", breed: "Berner-Sennen", age: 6), ...]
        -> create a variable for animalName (String)
                because the Tuple does not yet contain the animals name
        -> now go to the viewDidLoad()
     */
    var animalInformation: (birthPlace: String, breed: String, age: Int) =
        (birthPlace: "Torhout", breed: "Berner-Sennen", age: 6)
    var animalName = "Chuck"
    let dogImageArray = [#imageLiteral(resourceName: "Chuck"), #imageLiteral(resourceName: "Happy"), #imageLiteral(resourceName: "Wobbes"), #imageLiteral(resourceName: "Wimpie")]
    
    
    //  MARK: - Overridden Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
            fill the 3 labels and the imageview with the initial data
        */
        self.animalNameLabel.text = animalName
        self.animalAgeLabel.text = "\(animalInformation.age) years"
        self.animalBreedLabel.text = animalInformation.breed
        self.animalImageView.image = dogImageArray[0]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}
