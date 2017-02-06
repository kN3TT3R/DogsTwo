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
 */


import UIKit


class AddAnimalViewController: UIViewController, UITextFieldDelegate {

    
    
    // MARK: - IBOutlets
    @IBOutlet weak var dogNameTextField: UITextField!
    @IBOutlet weak var dogBirthPlaceTextField: UITextField!
    @IBOutlet weak var dogBreedTextField: UITextField!
    @IBOutlet weak var dogAgeTextField: UITextField!

    
    
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
        
//        if textField.tag == 1 {
//            newDog.name = dogNameTextField.text!
//        }
//        if textField.tag == 2 {
//            newDog.birthPlace = dogBirthPlaceTextField.text!
//        }
//        if textField.tag == 3 {
//            newDog.breed = dogBreedTextField.text!
//        }
//        if textField.tag == 4 {
//            newDog.age = Int(dogAgeTextField.text!)!
//        }
//        
//        print("\(newDog.age)")
    }
    
    
    
//    // MARK: - IBActions
//    @IBAction func addDog(_ sender: UIButton) {
//        
//    }

    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}










