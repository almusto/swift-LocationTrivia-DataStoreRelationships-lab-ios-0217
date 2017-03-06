//
//  AddLocationViewController.swift
//  swift-LocationTrivia-DataStoreRelationships-lab
//
//  Created by Alessandro Musto on 3/6/17.
//  Copyright © 2017 Flatiron School. All rights reserved.
//

import UIKit


protocol AddLocationDelegate: class {
  func createLocation(location: Location)
  func addTrivium(toLocation location: Location, trivium: Trivium)
}



class AddLocationViewController: UIViewController {

  @IBOutlet weak var nameTextField: UITextField!
  @IBOutlet weak var latitudeTextField: UITextField!
  @IBOutlet weak var longitudeTextField: UITextField!

  @IBOutlet weak var cancelButton: UIButton!

  @IBOutlet weak var saveButton: UIButton!

    weak var delegate: AddLocationDelegate?


    override func viewDidLoad() {
        super.viewDidLoad()

      nameTextField.accessibilityLabel = "nameField"
      nameTextField.accessibilityIdentifier = "nameField"

      latitudeTextField.accessibilityLabel = "latitudeField"
      latitudeTextField.accessibilityIdentifier = "latitudeField"

      longitudeTextField.accessibilityLabel = "longitudeField"
      longitudeTextField.accessibilityIdentifier = "longitudeField"

      cancelButton.accessibilityLabel = "cancelButton"
      cancelButton.accessibilityIdentifier = "cancelButton"

      saveButton.accessibilityLabel = "saveButton"
      saveButton.accessibilityIdentifier = "saveButton"



    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

  @IBAction func cancelFired(_ sender: UIButton) {
    self.dismiss(animated: true, completion: nil)
  }


  @IBAction func saveFired(_ sender: UIButton) {
    guard let dele = delegate,
      let name = nameTextField.text,
      let latitude = latitudeTextField.text,
      let longitude = longitudeTextField.text else { return }
    let location = Location(name: name, latitude: Float(latitude)!, longitude: Float(longitude)!)
    dele.createLocation(location: location)

    self.dismiss(animated: true, completion: nil)
  }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
