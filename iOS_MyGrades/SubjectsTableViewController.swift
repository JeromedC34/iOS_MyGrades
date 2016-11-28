//
//  SubjectTableViewController.swift
//  iOS_MyGrades
//
//  Created by imac on 21/11/2016.
//  Copyright © 2016 imac. All rights reserved.
//

import UIKit

class SubjectsTableViewController: UITableViewController {
    
    @IBOutlet weak var uiNavigationItemTitle: UINavigationItem!
    private var _myGrades:MyGrades = MyGrades.instance
    func setDisplay() {
        let addString:String
        if let myAverage = _myGrades.getAverage() {
            addString = String(myAverage)
        } else {
            addString = Subject.NO_NOTE_YET
        }
        uiNavigationItemTitle.title = "Subjects - " + addString
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
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
        return _myGrades.subjectsList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "subject-cell", for: indexPath)
        
        let addString:String
        if let myAverage = _myGrades.subjectsList[indexPath.row].getAverage() {
            addString = String(myAverage)
        } else {
            addString = Subject.NO_NOTE_YET
        }
        cell.textLabel?.text = _myGrades.getSubject(atIndex: indexPath.row).getName() + " - " + addString
        
        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "show-subject",
            let subjectMarksController = segue.destination as? SubjectMarksTableViewController {
            subjectMarksController.subject = _myGrades.subjectsList[(tableView.indexPathForSelectedRow?.row)!]
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData()
        setDisplay()
    }
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            _myGrades.getSubject(atIndex: indexPath.section).delete()
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    
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
