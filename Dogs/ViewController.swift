//
//  ViewController.swift
//  Dogs
//  Version 1.2 - Tuples
//  Version 1.3 - Dictionary
//
//  Created by Kenneth Debruyn on 10/01/17.
//  Copyright © 2017 kN3TT3R. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    // MARK: - Global properties
    let dogImageArray = [#imageLiteral(resourceName: "Chuck"), #imageLiteral(resourceName: "Happy"), #imageLiteral(resourceName: "Wobbes"), #imageLiteral(resourceName: "Wimpie")]
    
    // Version 1.2
    //    let dogInfoArray = [ (name: "Chuck", birthPlace: "Torhout", breed: "Berner-Sennen", age: 6),
    //                         (name: "Wobbes", birthPlace: "Werchter", breed: "Jack-Russell", age: 4),
    //                         (name: "Wimpie", birthPlace: "Leuven", breed: "Labrador", age: 2),
    //                         (name: "Happy", birthPlace: "Brugge", breed: "Golden Retriever", age: 8)]
    
    // Version 1.3
    /// dogInfoDictionary: a Dictionary
    ///     - key is the name of the dog
    ///     - value is a Tuple containing (birthplace, breed, age)
    let dogInfoDictionary = [
        "Chuck": (birthPlace: "Torhout", breed: "Berner-Sennen", age: 6),
        "Wobbes": (birthPlace: "Werchter", breed: "Jack-Russell", age: 4),
        "Wimpie": (birthPlace: "Leuven", breed: "Labrador", age: 2),
        "Happy": (birthPlace: "Brugge", breed: "Golden Retriever", age: 8)
    ]
    let dogNames = ["Chuck", "Wobbes", "Wimpie", "Happy"]
    
    var dog = Dog()
    var dogCounter = 0
    
    
    // MARK: - Structures
    /// Structure Dog
    /// properties
    ///     - name: the name of the dog
    ///     - birthPlace: the birthplace of the dog
    ///     - breed: the breed of the dog
    ///     - description: the description of the dog
    ///     - age: the age of the dog
    ///     - image: the image for the dog
    struct Dog {
        var name = ""
        var birthPlace = ""
        var breed = ""
        var age = 0
        var description = ""
        var image = UIImage()
    }
    
    
    // MARK: - IBOutlets
    @IBOutlet weak var dogNameLabel: UILabel!
    @IBOutlet weak var dogImageView: UIImageView!
    @IBOutlet weak var dogDescriptionView: UITextView!
    
    
    // MARK: - IBAction
    @IBAction func displayNextDog(_ sender: UIButton) {
        loadNextDog()
    }
    
    @IBAction func displayPreviousDog(_ sender: UIButton) {
        loadPreviousDog()
    }
    
    
    // MARK: - Overridden Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        loadNextDog()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    // MARK: - Homemade Functions
    /// Function which will:
    ///     -> create a new instance of Dog
    ///     -> add a name, description and image to the dog based on the Tuple
    ///     -> call updateView to update the info to the view
    func loadNextDog() {
        
        // checks on 'index out of bound'
        if dogCounter == dogImageArray.count {
            dogCounter = 0
        }
        
        // Version 1.2
        //        let dogInfoTuple = dogInfoDictionary[dogCounter]
        //        dog.name = dogInfoTuple.name
        //        dog.birthPlace = dogInfoTuple.birthPlace
        //        dog.breed = dogInfoTuple.breed
        //        dog.age = dogInfoTuple.age
        //        dog.description = "Ik ben \(dog.name). Ik kom uit \(dog.birthPlace). Net zoals mijn moeder ben ik een \(dog.breed). Ik ben nu \   (dog.age) jaar oud."
        
        
        // Version 1.3
        let dogName = dogNames[dogCounter]
        let dogInfoTuple = dogInfoDictionary[dogName]
        dog.name = dogName
        dog.birthPlace = dogInfoTuple!.birthPlace
        dog.breed = dogInfoTuple!.breed
        dog.age = dogInfoTuple!.age
        dog.description = "Ik ben \(dog.name). Ik kom uit \(dog.birthPlace). Net zoals mijn moeder ben ik een \(dog.breed). Ik ben nu \(dog.age) jaar oud."
        dog.image = dogImageArray[dogCounter]
        
        updateView()
        
        dogCounter += 1
    }
    
    /// Function which will:
    ///     -> create a new instance of Dog
    ///     -> add a name, description and image to the dog based on the Tuple
    ///     -> call updateView to update the info to the view
    func loadPreviousDog() {
        // checks on 'index out of bound'
        if dogCounter == 0 {
            dogCounter = dogImageArray.count
        }
        
        dogCounter -= 1
        
        // Version 1.2
        //        let dogInfoTuple = dogInfoDictionary[dogCounter]
        //        dog.name = dogInfoTuple.name
        //        dog.birthPlace = dogInfoTuple.birthPlace
        //        dog.breed = dogInfoTuple.breed
        //        dog.age = dogInfoTuple.age
        
        // Version 1.3
        let dogName = dogNames[dogCounter]
        let dogInfoTuple = dogInfoDictionary[dogName]
        dog.name = dogName
        dog.birthPlace = dogInfoTuple!.birthPlace
        dog.breed = dogInfoTuple!.breed
        dog.age = dogInfoTuple!.age
        dog.description = "Ik ben \(dog.name). Ik kom uit \(dog.birthPlace). Net zoals mijn moeder ben ik een \(dog.breed). Ik ben nu \(dog.age) jaar oud."
        dog.image = dogImageArray[dogCounter]
        
        updateView()
    }
    
    /// Function which will update the view based on a specific instance of Dog
    func updateView() {
        dogNameLabel.text = dog.name
        dogImageView.image = dog.image
        dogDescriptionView.text = dog.description
    }
}











