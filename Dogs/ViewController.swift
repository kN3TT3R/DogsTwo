//
//  ViewController.swift
//  Dogs
//
//  Created by Kenneth Debruyn on 10/01/17.
//  Copyright © 2017 kN3TT3R. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    //MARK: - Global properties
    let dogNames = ["Chuck", "Wobbes", "Wimpie", "Happy"]
    let dogImageArray = [#imageLiteral(resourceName: "Chuck"), #imageLiteral(resourceName: "Happy"), #imageLiteral(resourceName: "Wobbes"), #imageLiteral(resourceName: "Wimpie")]
    let dogDescriptionText = " , lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda."
    var dog = Dog()
    var dogCounter = 0
    
    /// Structure Dog
    /// properties
    ///     - name: the name of the dog
    ///     - description: the description of the dog
    ///     - image: the image for the dog
    struct Dog {
        var name = ""
        var description = ""
        var image = UIImage()
    }
    
    
    // MARK: - IBOutlets
    @IBOutlet weak var dogName: UILabel!
    @IBOutlet weak var dogImage: UIImageView!
    @IBOutlet weak var dogDescription: UITextView!
    
    
    // MARK: - IBAction
    @IBAction func displayNextDog(_ sender: UIButton) {
        loadNextDog()
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
    ///     -> add a name, description and image to the dog
    ///     -> load the dog to the view
    ///     -> checks on 'index out of bound'
    func loadNextDog() {
        if dogCounter == dogImageArray.count {
            dogCounter = 0
        }
        dog.name = dogNames[dogCounter]
        dog.description = dog.name + dogDescriptionText
        dog.image = dogImageArray[dogCounter]
        
        dogName.text = dog.name
        dogImage.image = dog.image
        dogDescription.text = dog.description
        
        dogCounter += 1
    }
}











