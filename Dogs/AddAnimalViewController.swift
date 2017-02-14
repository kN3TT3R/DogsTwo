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
 
            By adopting the UITextFieldDelegate protocol, you tell the compiler that the VC class can act as a valid text field delegate. This means you can implement the protocol’s methods to handle text input, and you can assign instances of the ViewController class as the delegate of the text field.
 
        SAVE BUTTON IBOUTLET
            You care about configuring and passing the Dog only if the Save button was tapped.
            To be able to determine when this happens, add the Save button as an outlet in AddAnimalVC.swift.
 
        UNWIND SEGUE
            The task now is to pass the Dog object to DogTableVC when a user taps the Save button and discard it when a user taps the Cancel button, switching from displaying the dog detail scene to displaying the dog list in either case. To accomplish this, you’ll use an unwind segue. An unwind segue moves backward through one or more segues to return the user to a scene managed by an existing view controller. While regular segues create a new instance of the destination VC, unwind segues let you return to VCs that already exist. Use unwind segues to implement navigation back to an existing VC.
            prepare(for:sender:) -> gives you a chance to store data.
 
        NEXT STEP -> DogTableViewController
 
        NEXT STEP -> AddAnimalViewController
            To link the Save button to the unwindToDogList action method:
                -> Open your storyboard.
                -> On the canvas, Control-drag from the Save button to the Exit item at the top of the  add animal detail scene.
 */


import UIKit
import os.log


class AddAnimalViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    
    // MARK: - IBOutlets
    @IBOutlet weak var dogNameTextField: UITextField!
    @IBOutlet weak var dogBirthPlaceTextField: UITextField!
    @IBOutlet weak var dogBreedTextField: UITextField!
    @IBOutlet weak var dogAgeTextField: UITextField!
    @IBOutlet weak var dogPhotoImageView: UIImageView!
    @IBOutlet weak var saveDogButton: UIBarButtonItem!
    
    /*
        This value is either passed by `DogTableViewController` in `prepare(for:sender:)`
        or constructed as part of adding a new dog.
     */
    var dog: Dog?

    
    
    // MARK: - Properties
    var newDogImage = UIImage()
    
    
    
    // MARK: - Overridden Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        dogNameTextField.delegate = self
        dogBirthPlaceTextField.delegate = self
        dogBreedTextField.delegate = self
        dogAgeTextField.delegate = self
        
        // Enable the Save button only if the text field has a valid Meal name.
        updateSaveButtonState()
    }
    
    
    
    //MARK: UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard.
        textField.resignFirstResponder()
        return true
    }
    
    /*
        The textFieldDidBeginEditing method gets called when an editing session begins, or when the keyboard 
        gets displayed. This code disables the Save button while the user is editing the text field.
     */
    func textFieldDidBeginEditing(_ textField: UITextField) {
        // Disable the Save button while editing.
        saveDogButton.isEnabled = false
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        updateSaveButtonState()
        navigationItem.title = textField.text
    }

    
    
    //MARK: UIImagePickerControllerDelegate
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        // Dismiss the picker if the user canceled.
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        // The info dictionary may contain multiple representations of the image. You want to use the original.
        guard let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        
        // Set photoImageView to display the selected image.
        dogPhotoImageView.image = selectedImage
        
        // Dismiss the picker.
        dismiss(animated: true, completion: nil)
    }

    
    
    // MARK: Navigation
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
    // MARK: - Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        // Configure the destination view controller only when the save button is pressed.
        guard let button = sender as? UIBarButtonItem, button === saveDogButton else {
            os_log("The save button was not pressed, cancelling", log: OSLog.default, type: .debug)
            return
        }
        
        let name = dogNameTextField.text ?? ""
        let birthPlace = dogBirthPlaceTextField.text
        let breed = dogBreedTextField.text
        let age = dogAgeTextField.text
        let photo = dogPhotoImageView.image
        
        // Set the dog to be passed to DogTableViewController after the unwind segue.
        dog = Dog(name: name, birthPlace: birthPlace, breed: breed, age: Int(age!), photo: photo)
    }
    

    
    // MARK: - Actions
    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
        // Hide the keyboard so that if the user taps the image view while typing in the text field,
        // the keyboard is dismissed properly.
        dogNameTextField.resignFirstResponder()
        
        // UIImagePickerController is a view controller that lets a user pick media from their photo library.
        let imagePickerController = UIImagePickerController()
        
        // Only allow photos to be picked, not taken.
        imagePickerController.sourceType = .photoLibrary
        
        // Make sure ViewController is notified when the user picks an image.
        imagePickerController.delegate = self
        
        present(imagePickerController, animated: true, completion: nil)
    }
    /*
     GESTURE RECOGNIZER are objects that you attach to a view that allow Gesture recognizers interpret touches
     to determine whether they correspond to a specific gesture, such as a swipe, pinch, or rotation.
     You can write an action method that is called when a gesture recognizer recognizes its assigned gesture,
     which is exactly what you need to do for the image view.
     */
    

    
    //MARK: Private Methods
    private func updateSaveButtonState() {
        // Disable the Save button if the text field is empty.
        let text = dogNameTextField.text ?? ""
        saveDogButton.isEnabled = !text.isEmpty
    }

}










