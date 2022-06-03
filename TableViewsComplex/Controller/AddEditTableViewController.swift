//
//  AddEditTableViewController.swift
//  TableViewsComplex
//
//  Created by Danylo Kushlianskyi on 02.06.2022.
//

import UIKit

class AddEditTableViewController: UITableViewController {
    
    @IBOutlet weak var saveBtn: UIBarButtonItem!
    @IBOutlet weak var cancelBtn: UIBarButtonItem!
    var country: Country?
    
    @IBOutlet weak var flagField: UITextField!
    @IBOutlet weak var populationField: UITextField!
    @IBOutlet weak var regionField: UITextField!
    @IBOutlet weak var countryField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let country = country {
            flagField.text = country.flag
            populationField.text = country.population
            regionField.text = country.region
            countryField.text = country.name
        }
        
        updateSabeBtn()
        
    }
    
    func updateSabeBtn(){
        let flagText = flagField.text ?? ""
        let populationText = populationField.text ?? ""
        let regionText = regionField.text ?? ""
        let countryText = countryField.text ?? ""
        
        saveBtn.isEnabled = flagText != "" && populationText != "" && regionText != "" && countryText != ""
    }
    
    @IBAction func checkIfEmpty(_ sender: UITextField){
        updateSabeBtn()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        guard segue.identifier == "unwindSave" else {return}
        
        let flagText = flagField.text ?? ""
        let populationText = populationField.text ?? ""
        let regionText = regionField.text ?? ""
        let countryText = countryField.text ?? ""
        
        country = Country(name: countryText, region: regionText, flag: flagText, population: populationText)
    }
    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return 0
//    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
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

    
    // MARK: - Navigation


//


}
