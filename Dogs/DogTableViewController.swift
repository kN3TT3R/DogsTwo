//
//  DogTableViewController.swift
//  Dogs
//
//  Created by Kenneth Debruyn on 5/02/17.
//  Copyright © 2017 kN3TT3R. All rights reserved.
//


/*
        NEXT STEP -> @IBAction func unwindToDogList(sender: UIStoryboardSegue)
            The next step in creating the unwind segue is to add an action method to the destination VC
            (the VC that the segue is going to). This method must be marked with the IBAction attribute and
            take a segue (UIStoryboardSegue) as a parameter. Because you want to unwind back to the dog list scene,
            you need to add an action method with this format to DogTableVC.swift. In this method, you’ll write
            the logic to add the new dog (that’s passed from AddAnimalVC, the source VC) to the dog list data
            and add a new row to the table view in the dog list scene.
        NEXT STEP -> AddAnimalViewController
 */


import UIKit

class DogTableViewController: UITableViewController {
 
    
    // MARK: - Properties for Dog Class using DogCollection
    var dogs = [Dog]()
    
    
    
    // MARK: - Overridden Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load the sample data.
        loadSampleDogs()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dogs.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "DogTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? DogTableViewCell else {
            fatalError("The dequeued cell is not an instance of DogTableViewCell.")
        }
        
        // Fetches the appropriate dog for the data source layout.
        let dog = dogs[indexPath.row]

        cell.dogNameLabel.text = dog.name
        cell.dogBreedLabel.text = dog.breed
        cell.dogPhotoImageView.image = dog.photo
        
        return cell
    }
    
    
    
    // MARK: - IBActions
    @IBAction func unwindToDogList(sender: UIStoryboardSegue) {
        
        if let sourceViewController = sender.source as? AddAnimalViewController, let dog = sourceViewController.dog {
            
            // Add a new dog.
            let newIndexPath = IndexPath(row: dogs.count, section: 0)
            
            dogs.append(dog)
            
            tableView.insertRows(at: [newIndexPath], with: .automatic)
        }
    }
    
    
    // MARK: - Private Functions
    private func loadSampleDogs() {
        
        let photo1 = UIImage(named: "Chuck")
        let photo2 = UIImage(named: "Wobbes")
        let photo3 = UIImage(named: "Wimpie")
        let photo4 = UIImage(named: "Happy")
        
        guard let dog1 = Dog(name: "Dog1", birthPlace: "Place 1", breed: "Breed 1", age: 1, photo: photo1) else {
            fatalError("Unable to instantiate dog1")
        }
        
        guard let dog2 = Dog(name: "Dog2", birthPlace: "Place 2", breed: "Breed 2", age: 2, photo: photo2) else {
            fatalError("Unable to instantiate dog2")
        }
        
        guard let dog3 = Dog(name: "Dog3", birthPlace: "Place 3", breed: "Breed 3", age: 3, photo: photo3) else {
            fatalError("Unable to instantiate dog3")
        }
        
        guard let dog4 = Dog(name: "Dog4", birthPlace: "Place 4", breed: "Breed 4", age: 4, photo: photo4) else {
            fatalError("Unable to instantiate dog4")
        }
        
        dogs += [dog1, dog2, dog3, dog4]

    }
}
































