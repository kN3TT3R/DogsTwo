//
//  DogTableViewController.swift
//  Dogs
//
//  Created by Kenneth Debruyn on 5/02/17.
//  Copyright © 2017 kN3TT3R. All rights reserved.
//

import UIKit

class DogTableViewController: UITableViewController {
    
    
    
    // MARK: - Properties
    var currentDog = Animal()
    var dogImageCollection = ImageCollection()
    var dogCollection = AnimalCollection()

    
    // MARK: - Overridden Functions
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // Load the sample data.
        loadSampleDogs()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dogCollection.collection.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "DogTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? DogTableViewCell else {
            fatalError("The dequeued cell is not an instance of DogTableViewCell.")
        }
        
        // Fetches the appropriate meal for the data source layout.
        let dog = dogCollection.collection[indexPath.row]
        let dogPhoto = dogImageCollection.getImage(with: indexPath.row)

        cell.dogNameLabel.text = dog.name
        cell.dogPhotoImageView.image = dogPhoto
        
        return cell
    }
    
    
//    
//    // MARK: - IBActions
//    @IBAction func unwindToMealList(sender: UIStoryboardSegue) {
//        
//        if let sourceViewController = sender.source as? MealViewController, let meal = sourceViewController.meal {
//            
//            // Add a new dog.
//            let newIndexPath = IndexPath(row: dogs.count, section: 0)
//            
//            dogs.append(dog)
//            
//            tableView.insertRows(at: [newIndexPath], with: .automatic)
//        }
//    }
    
    
    // MARK: - Private Functions
    private func loadSampleDogs() {}
}
































