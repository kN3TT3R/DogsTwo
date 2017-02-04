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
    let dogImageArray = [#imageLiteral(resourceName: "Chuck"), #imageLiteral(resourceName: "Happy"), #imageLiteral(resourceName: "Wobbes"), #imageLiteral(resourceName: "Wimpie")]
    var dogImage = UIImage()
    var dogImageCollection = ImageCollection()
    
    var currentDog = Animal()
    var dogCollection = AnimalCollection()
    
    var dogID = 0
    
    
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
        dogImage = dogImageCollection.getImage(with: dogID)
        updateView()
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
            destinationVC.currentDog = self.currentDog
            destinationVC.image = dogImage
        }
    }
    
    
    // MARK: - Homemade Functions
    func loadNextDog() {
        if dogID == dogImageArray.count {
            dogID = 0
        }
        
        currentDog = dogCollection.getAnimal(with: dogID)
        dogImage = dogImageCollection.getImage(with: dogID)
        selectionBar.selectedSegmentIndex = dogID
        
        updateView()
        
        dogID += 1
    }
    
    func loadPreviousDog() {
        if dogID == 0 {
            dogID = dogImageArray.count
        }
        
        dogID -= 1
        
        currentDog = dogCollection.getAnimal(with: dogID)
        dogImage = dogImageCollection.getImage(with: dogID)
        selectionBar.selectedSegmentIndex = dogID
        
        updateView()
    }
    
    func updateView() {
        dogNameLabel.text = currentDog.name
        dogImageView.image = dogImage
    }
}





