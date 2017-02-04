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
    var dog = Animal()
    var dogArray = AnimalCollection()
    var image = UIImage()
    var dogCounter = 0
    
    
    // MARK: - IBAction
    @IBAction func displayNextDog(_ sender: UIButton) {
        loadNextDog()
    }
    
    @IBAction func displayPreviousDog(_ sender: UIButton) {
        loadPreviousDog()
    }
    
    @IBAction func selectSpecificDog(_ sender: UISegmentedControl) {
        dogCounter = sender.selectedSegmentIndex
        dog = dogArray.collection[dogCounter]
        image = dogImageArray[dogCounter]
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
            destinationVC.dog = self.dog
            destinationVC.image = image
        }
    }
    
    
    // MARK: - Homemade Functions
    func loadNextDog() {
        if dogCounter == dogImageArray.count {
            dogCounter = 0
        }
        
        dog = dogArray.collection[dogCounter]
        image = dogImageArray[dogCounter]
        selectionBar.selectedSegmentIndex = dogCounter
        
        updateView()
        
        dogCounter += 1
    }
    
    func loadPreviousDog() {
        if dogCounter == 0 {
            dogCounter = dogImageArray.count
        }
        
        dogCounter -= 1
        
        dog = dogArray.collection[dogCounter]
        image = dogImageArray[dogCounter]
        selectionBar.selectedSegmentIndex = dogCounter
        
        updateView()
    }
    
    func updateView() {
        dogNameLabel.text = dog.name
        dogImageView.image = image
    }
}





