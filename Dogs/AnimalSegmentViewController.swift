//
//  AnimalSegmentViewController.swift
//  Dogs
//
//  Created by Kenneth Debruyn on 10/01/17.
//  Copyright © 2017 kN3TT3R. All rights reserved.
//


import UIKit


class AnimalSegmentViewController: UIViewController {
    
    
    
    // MARK: - IBOutlets
    @IBOutlet weak var dogNameLabel: UILabel!
    @IBOutlet weak var dogImageView: UIImageView!
    @IBOutlet weak var selectionBar: UISegmentedControl!
    
    
    
    // MARK: - Properties
    //var dogID = 0
    var currentDog = Animal()
    var currentDogImage = UIImage()
    
    var dogImageCollection = ImageCollection()
    var dogCollection = AnimalCollection()
    
    
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDogDetail" {
            let destinationVC = segue.destination as! AnimalDetailViewController
            destinationVC.currentDog = self.currentDog
            destinationVC.currentDogImage = currentDogImage
        }
    }

    
    
    // MARK: - IBAction
    @IBAction func displayNextDog(_ sender: UIButton) {
        loadNextDog()
    }
    
    @IBAction func displayPreviousDog(_ sender: UIButton) {
        loadPreviousDog()
    }
    
    @IBAction func selectSpecificDog(_ sender: UISegmentedControl) {
        let dogID = sender.selectedSegmentIndex
        currentDog = dogCollection.getAnimal(with: dogID)
        currentDogImage = dogImageCollection.getImage(with: dogID)
        updateView()
    }
    
    
    
    // MARK: - Overridden Functions
    override func viewDidLoad() {
        super.viewDidLoad()
//        currentDog = Animal(animalID: 0, name: "Chuck", birthPlace: "Place 1", breed: "Breed 1", age: 2, description: "Description 1")
        currentDog = Animal(animalID: 0, name: "Chuck", birthPlace: "Place 1", breed: "Breed 1", age: 2)
        currentDogImage = #imageLiteral(resourceName: "Chuck")
        updateView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
    // MARK: - Homemade Functions
    func loadNextDog() {
        currentDog = dogCollection.getNextAnimal(for: currentDog.animalID!)
        currentDogImage = dogImageCollection.getImage(with: currentDog.animalID!)
        selectionBar.selectedSegmentIndex = currentDog.animalID!
        updateView()
    }
    
    func loadPreviousDog() {
        currentDog = dogCollection.getPreviousAnimal(for: currentDog.animalID!)
        currentDogImage = dogImageCollection.getImage(with: currentDog.animalID!)
        selectionBar.selectedSegmentIndex = currentDog.animalID!
        updateView()
    }
    
    func updateView() {
        dogNameLabel.text = currentDog.name
        dogImageView.image = currentDogImage
    }
}





