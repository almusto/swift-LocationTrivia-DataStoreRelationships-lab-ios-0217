//
//  AddTriviaViewController.swift
//  swift-LocationTrivia-DataStoreRelationships-lab
//
//  Created by Alessandro Musto on 3/6/17.
//  Copyright © 2017 Flatiron School. All rights reserved.
//

import UIKit

class AddTriviaViewController: UIViewController {

  @IBOutlet weak var triviumField: UITextField!
  @IBOutlet weak var saveButton: UIButton!
  @IBOutlet weak var cancelButton: UIButton!
  var location: Location!
  var delegate: AddLocationDelegate?





    override func viewDidLoad() {
        super.viewDidLoad()


      triviumField.accessibilityLabel = "Trivium Text Field"
      triviumField.accessibilityIdentifier = "Trivium Text Field"

      cancelButton.accessibilityLabel = "Cancel Button"
      cancelButton.accessibilityIdentifier = "Cancel Button"

      saveButton.accessibilityLabel = "Save Button"
      saveButton.accessibilityIdentifier = "Save Button"

        // Do any additional setup after loading the view.
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
      let text = triviumField.text else { return }
    let trivium = Trivium(content: text, likes: 0)
    dele.addTrivium(toLocation: location, trivium: trivium)
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
