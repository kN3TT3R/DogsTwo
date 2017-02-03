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
    
    
    // MARK: - Structure
    struct Dog {
        var name = ""
        var birthPlace = ""
        var breed = ""
        var age = 0
        var description = ""
        var image = UIImage()
    }
    
    
    // MARK: - Global Properties
    let dogInfoDictionary = [
        "Chuck": (birthPlace: "Torhout", breed: "Berner-Sennen", age: 6),
        "Wobbes": (birthPlace: "Werchter", breed: "Jack-Russell", age: 4),
        "Wimpie": (birthPlace: "Leuven", breed: "Labrador", age: 2),
        "Happy": (birthPlace: "Brugge", breed: "Golden Retriever", age: 8)
    ]
    let dogNames = ["Chuck", "Wobbes", "Wimpie", "Happy"]
    let dogImageArray = [#imageLiteral(resourceName: "Chuck"), #imageLiteral(resourceName: "Happy"), #imageLiteral(resourceName: "Wobbes"), #imageLiteral(resourceName: "Wimpie")]
    var dog = Dog()
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
            destinationVC.dog.name = self.dog.name
            destinationVC.dog.age = self.dog.age
            destinationVC.dog.breed = self.dog.breed
            destinationVC.dog.image = self.dog.image
        }
    }
    
    
    // MARK: - Homemade Functions
    func loadNextDog() {
        if dogCounter == dogImageArray.count {
            dogCounter = 0
        }

        let dogName = dogNames[dogCounter]
        let dogInfoTuple = dogInfoDictionary[dogName]
        dog.name = dogName
        dog.birthPlace = dogInfoTuple!.birthPlace
        dog.breed = dogInfoTuple!.breed
        dog.age = dogInfoTuple!.age
        dog.description = "Ik ben \(dog.name). Ik kom uit \(dog.birthPlace). " +
            "Net zoals mijn moeder ben ik een \(dog.breed). Ik ben nu \(dog.age) jaar oud."
        dog.image = dogImageArray[dogCounter]
        
        updateView()
        
        dogCounter += 1
    }
    
    func loadPreviousDog() {
        if dogCounter == 0 {
            dogCounter = dogImageArray.count
        }
        
        dogCounter -= 1

        let dogName = dogNames[dogCounter]
        dog.name = dogName
        dog.image = dogImageArray[dogCounter]
        
        updateView()
    }
    
    func updateView() {
        dogNameLabel.text = dog.name
        dogImageView.image = dog.image
    }
}











