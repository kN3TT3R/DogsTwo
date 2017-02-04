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
    @IBOutlet weak var selectionBar: UISegmentedControl!
    
    
    // MARK: - Global Properties
    var dogID = 0
    var currentDog = Animal()
    var currentDogImage = UIImage()
    
    var dogImageCollection = ImageCollection()
    var dogCollection = AnimalCollection()

    
    // MARK: - IBAction
    @IBAction func displayNextDog(_ sender: UIButton) {
        loadNextDog()
    }
    
    @IBAction func displayPreviousDog(_ sender: UIButton) {
        loadPreviousDog()
    }
    
    @IBAction func selectSpecificDog(_ sender: UISegmentedControl) {
        dogID = sender.selectedSegmentIndex
        currentDog = dogCollection.getAnimal(with: dogID)
        currentDogImage = dogImageCollection.getImage(with: dogID)
        updateView()
    }
    
    
    // MARK: - Overridden Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        loadNextDog()
        print(dogImageCollection.collection.count)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDogDetail" {
            let destinationVC = segue.destination as! AnimalViewController
            destinationVC.currentDog = self.currentDog
            destinationVC.currentDogImage = currentDogImage
        }
    }
    
    
    // MARK: - Homemade Functions
    func loadNextDog() {
        if dogID == dogImageCollection.collection.count {
            dogID = 0
        }
        
        currentDog = dogCollection.getAnimal(with: dogID)
        currentDogImage = dogImageCollection.getImage(with: dogID)
        selectionBar.selectedSegmentIndex = dogID
        
        updateView()
        
        dogID += 1
    }
    
    func loadPreviousDog() {
        if dogID == 0 {
            dogID = dogImageCollection.collection.count
        }
        
        dogID -= 1
        
        currentDog = dogCollection.getAnimal(with: dogID)
        currentDogImage = dogImageCollection.getImage(with: dogID)
        selectionBar.selectedSegmentIndex = dogID
        
        updateView()
    }
    
    func updateView() {
        dogNameLabel.text = currentDog.name
        dogImageView.image = currentDogImage
    }
}





