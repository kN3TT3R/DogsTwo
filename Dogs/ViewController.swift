//
//  ViewController.swift
//  Dogs
//
//  Created by Kenneth Debruyn on 10/01/17.
//  Copyright © 2017 kN3TT3R. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    // MARK: - IBOutlets
    @IBOutlet weak var dogNameLabel: UILabel!
    @IBOutlet weak var dogImageView: UIImageView!
    
    
    // MARK: - Global Properties
    let dogArray = [Animal(name: "Chuck", birthPlace: "Place 1", breed: "Breed 1", age: 2, description: "Description 1"),
                    Animal(name: "Wobbes", birthPlace: "Place 2", breed: "Breed 2", age: 4, description: "Description 2"),
                    Animal(name: "Wimpie", birthPlace: "Place 3", breed: "Breed 3", age: 6, description: "Description 3"),
                    Animal(name: "Happy", birthPlace: "Place 4", breed: "Breed 4", age: 8, description: "Description 4")]

    let dogImageArray = [#imageLiteral(resourceName: "Chuck"), #imageLiteral(resourceName: "Happy"), #imageLiteral(resourceName: "Wobbes"), #imageLiteral(resourceName: "Wimpie")]
    var dog = Animal()
    var image = UIImage()
    var dogCounter = 0
    
    
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
    
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDogDetail" {
            let destinationVC = segue.destination as! AnimalViewController
            destinationVC.dog = self.dog
            destinationVC.image = image
        }
    }
    
    
    // MARK: - Homemade Functions
    func loadNextDog() {
        if dogCounter == dogImageArray.count {
            dogCounter = 0
        }
        
        dog = dogArray[dogCounter]
        image = dogImageArray[dogCounter]
        
        updateView()
        
        dogCounter += 1
    }
    
    func loadPreviousDog() {
        if dogCounter == 0 {
            dogCounter = dogImageArray.count
        }
        
        dogCounter -= 1
        
        dog = dogArray[dogCounter]
        image = dogImageArray[dogCounter]
        
        updateView()
    }
    
    func updateView() {
        dogNameLabel.text = dog.name
        dogImageView.image = image
    }
}





