//
//  TableViewController.swift
//  TableViewsComplex
//
//  Created by Danylo Kushlianskyi on 01.06.2022.
//

import UIKit

class TableViewController: UITableViewController {
    
    var countryBatch = CountryBatch.getCountries().counries
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = 44.0
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
          if segue.identifier == "EditFlag" {
              let indexPath = tableView.indexPathForSelectedRow!
              let country = countryBatch[indexPath.row]
              let navController = segue.destination as! UINavigationController
              let addEditController = navController.topViewController as! AddEditTableViewController
              addEditController.country = country
  
          }
      }
    
    @IBAction func unwindtoTableView(segue: UIStoryboardSegue){
        guard segue.identifier == "unwindSave",
              let sourceViewController = segue.source as? AddEditTableViewController,
              let country = sourceViewController.country else {return}
        if let selectedIndexPath = tableView.indexPathForSelectedRow {
            countryBatch[selectedIndexPath.row] = country
            tableView.reloadRows(at: [selectedIndexPath], with: .none)
        }
        else{
            let newIndexPath = IndexPath(row: countryBatch.count, section: 0)
            countryBatch.append(country)
            tableView.insertRows(at: [newIndexPath], with: .automatic)
        }
    }
    
    @IBAction func editPressed(_ sender: Any) {
        let tableViewEditingmode = tableView.isEditing
        tableView.setEditing(!tableViewEditingmode, animated: true)
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countryBatch.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryCell", for: indexPath) as! CountryTableViewCell
        
        let counry = countryBatch[indexPath.row]
        cell.update(country: counry)
        

        return cell
    }
    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let country = countryBatch[indexPath.row]
//
//        print("\(country.flag) \(indexPath)")
//    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let movedCountry = countryBatch.remove(at: sourceIndexPath.row)
        countryBatch.insert(movedCountry, at: destinationIndexPath.row)
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            countryBatch.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
    }
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
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
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
