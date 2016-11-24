//
//  SettingsViewController.swift
//  iOS_MyGrades
//
//  Created by imac on 23/11/2016.
//  Copyright © 2016 imac. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBAction func resetDatabase(_ sender: Any) {
        let alert = UIAlertController(title: "Empty database", message: "Every data will be deleted.\nDo you really want to do it?", preferredStyle: UIAlertControllerStyle.alert)
        self.present(alert, animated: true, completion: nil)
        alert.addAction(UIAlertAction(title: "No", style: UIAlertActionStyle.default, handler: nil))
        alert.addAction(UIAlertAction(title: "Yes", style: UIAlertActionStyle.default, handler: {
            action in
            switch action.style{
            default:
                MyGrades.instance.eraseAll()
            }
        }))
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
