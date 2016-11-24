//
//  SubjectMarksTableViewController.swift
//  iOS_MyGrades
//
//  Created by imac on 21/11/2016.
//  Copyright © 2016 imac. All rights reserved.
//

import UIKit

class SubjectMarksTableViewController: UITableViewController {
    @IBOutlet weak var navControllerItem: UINavigationItem!
    private var _subject:Subject?
    var subject:Subject {
        get {
            return _subject!
        }
        set {
            _subject = newValue
            setDisplay()
        }
    }
    private func setDisplay() {
        if let mySubject = _subject {
            if let myAverage = mySubject.getAverage() {
                navControllerItem.title = "\(mySubject.getName()) - \((myAverage * 100.0).rounded() / 100.0)"
            } else {
                navControllerItem.title = "\(mySubject.getName()) - \(Subject.NO_NOTE_YET)"
            }
        }
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
        return _subject!.marksList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mark-cell", for: indexPath)
        if let mySubject = _subject {
            cell.textLabel?.text = mySubject.marksList[indexPath.row].getName()
            cell.detailTextLabel?.text = "\(mySubject.marksList[indexPath.row].getCoefficient()) * \(mySubject.marksList[indexPath.row].getValue())"
        }
        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "add-new-mark",
            let navController = segue.destination as? UINavigationController,
            let newMarkController = navController.topViewController as? NewMarkViewController {
            newMarkController.mySubject = _subject!
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData()
        setDisplay()
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
