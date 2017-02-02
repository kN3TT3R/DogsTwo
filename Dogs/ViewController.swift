//
//  ViewController.swift
//  Dogs
//
//  Created by Kenneth Debruyn on 10/01/17.
//  Copyright © 2017 kN3TT3R. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    // MARK: - Global properties
    let dogNameArray = ["Chuck", "Wobbes", "Wimpie", "Happy"]
    //let dogImageArray = [#imageLiteral(resourceName: "Chuck"), #imageLiteral(resourceName: "Happy"), #imageLiteral(resourceName: "Wobbes"), #imageLiteral(resourceName: "Wimpie")]
    
    
    // Version 1.2 Beta
    let dogImageArray = [("Chuck", #imageLiteral(resourceName: "Chuck")),
                         ("Wobbes", #imageLiteral(resourceName: "Happy")),
                         ("Wimpie",#imageLiteral(resourceName: "Wobbes")),
                         ("Happy", #imageLiteral(resourceName: "Wimpie"))]
    
    let dogDescriptionText = " , lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur."
    /*
     "Ik ben dog.name. Ik kom uit dog.location. Net zoals mijn moeder ben ik een dog.race. Ik ben nu dog.age jaar oud."
     */
    
    
    
    var dog = Dog()
    var dogCounter = 0
    
    
    // MARK: - Structures
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
    @IBOutlet weak var dogNameLabel: UILabel!
    @IBOutlet weak var dogImageView: UIImageView!
    @IBOutlet weak var dogDescriptionView: UITextView!
    
    
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
        dog.name = dogNameArray[dogCounter]
        dog.description = dog.name + dogDescriptionText
        dog.image = dogImageArray[dogCounter]
        
        updateView()
        
        dogCounter += 1
    }
    
    
    /// Function which will update the view based on a specific instance of Dog
    func updateView() {
        dogNameLabel.text = dog.name
        dogImageView.image = dog.image
        dogDescriptionView.text = dog.description
    }
}











