//
//  AddAnimalViewController.swift
//  Dogs
//
//  Created by Kenneth Debruyn on 6/02/17.
//  Copyright © 2017 kN3TT3R. All rights reserved.
//


/*
        DELEGATION PATTERN
            - delegating object: dogNameTextField
                ->  keeps a reference to the other object, the delegate, and at the appropriate time,
                    the delegating object sends a message to the delegate.
                ->  it has a protocol UITextFieldDelegate
            - the message:
                -> tells the delegate object about an event that the delegating object is about to handle or has just handled.
                - delegate object: AddAnimalViewController
                -> it is very common to make a view controller the delegate for objects that it manages.
                -> it adopt the delegating object's protocol UITextFieldDelegate
 
            By adopting the UITextFieldDelegate protocol, you tell the compiler that the ViewController class
            can act as a valid text field delegate. This means you can implement the protocol’s methods to handle
            text input, and you can assign instances of the ViewController class as the delegate of the text field.
 
        SAVE BUTTON IBOUTLET
            You care about configuring and passing the Dog only if the Save button was tapped.
            To be able to determine when this happens, add the Save button as an outlet in AddAnimalVC.swift.
 
        UNWIND SEGUE
            The task now is to pass the Dog object to DogTableVC when a user taps the Save button
            and discard it when a user taps the Cancel button, switching from displaying the dog detail scene 
            to displaying the dog list in either case. To accomplish this, you’ll use an unwind segue.
            An unwind segue moves backward through one or more segues to return the user to a scene managed 
            by an existing view controller. While regular segues create a new instance of the destination VC, 
            unwind segues let you return to VCs that already exist. Use unwind segues to implement navigation 
            back to an existing VC.
            prepare(for:sender:) -> gives you a chance to store data.
 
        NEXT STEP -> DogTableViewController
 
        NEXT STEP -> AddAnimalViewController
            To link the Save button to the unwindToMealList action method:
                -> Open your storyboard.
                -> On the canvas, Control-drag from the Save button to the Exit item at the top of the  add animal detail scene.
 */


import UIKit
import os.log


class AddAnimalViewController: UIViewController, UITextFieldDelegate {

    
    // MARK: - IBOutlets
    @IBOutlet weak var dogNameTextField: UITextField!
    @IBOutlet weak var dogBirthPlaceTextField: UITextField!
    @IBOutlet weak var dogBreedTextField: UITextField!
    @IBOutlet weak var dogAgeTextField: UITextField!
    @IBOutlet weak var dogPhotoImageView: UIImageView!
    @IBOutlet weak var saveDogButton: UIBarButtonItem!
    
    /*
        This value is either passed by `MealTableViewController` in `prepare(for:sender:)`
        or constructed as part of adding a new meal.
     */
    var dog: Dog?

    
    
    // MARK: - Properties
    //var newDog = Animal()
    var newDogImage = UIImage()
    
    
    
    // MARK: - Overridden Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        dogNameTextField.delegate = self
        dogBirthPlaceTextField.delegate = self
        dogBreedTextField.delegate = self
        dogAgeTextField.delegate = self
    }
    
    
    
    //MARK: UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard.
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
    }
    
    
    
    //MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        // Configure the destination view controller only when the save button is pressed.
        guard let button = sender as? UIBarButtonItem, button === saveDogButton else {
            os_log("The save button was not pressed, cancelling", log: OSLog.default, type: .debug)
            return
        }
        
        let name = dogNameTextField.text ?? ""
        let birthPlace = dogBirthPlaceTextField?.text
        let breed = dogBreedTextField?.text
        let age = dogAgeTextField?.text
        let photo = dogPhotoImageView?.image
        
        // Set the dog to be passed to DogTableViewController after the unwind segue.
        dog = Dog(name: name, birthPlace: birthPlace, breed: breed, age: Int(age!), photo: photo)
    }
    

    
    // MARK: - IBActions


}










