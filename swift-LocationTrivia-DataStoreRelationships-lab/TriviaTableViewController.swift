//
//  TriviaTableViewController.swift
//  swift-LocationTrivia-DataStoreRelationships-lab
//
//  Created by Alessandro Musto on 3/6/17.
//  Copyright © 2017 Flatiron School. All rights reserved.
//

import UIKit

class TriviaTableViewController: UITableViewController {

  var location: Location!
  var triviaArray = [Trivium]()
  let store = LocationsDataStore.sharedInstance
  

    override func viewDidLoad() {
        super.viewDidLoad()

      tableView.accessibilityLabel = "Trivia Table"
      tableView.accessibilityIdentifier = "Trivia Table"


      self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(onAdd(_:)))




        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    triviaArray = location.trivia
    tableView.reloadData()
  }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return triviaArray.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "supCell", for: indexPath)
        let trivia = triviaArray[indexPath.row]
      cell.textLabel?.text = trivia.content
      cell.detailTextLabel?.text = String(trivia.likes)
      

        return cell
    }

  func onAdd(_ sender: UIBarButtonItem) {
    let vc = (
      storyboard?.instantiateViewController(
        withIdentifier: "addTrivia")
      )! as! AddTriviaViewController
//    let vc = AddTriviaViewController() as
    vc.modalTransitionStyle = .coverVertical
    vc.delegate = store
    vc.location = location
    self.present(vc, animated: true, completion: nil)

  }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
