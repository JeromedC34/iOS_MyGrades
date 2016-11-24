//
//  AddSubjectViewController.swift
//  iOS_MyGrades
//
//  Created by imac on 21/11/2016.
//  Copyright © 2016 imac. All rights reserved.
//

import UIKit

class AddSubjectViewController: UIViewController {
    private var _myGrades:MyGrades = MyGrades.instance
    @IBOutlet weak var newSubjectName: UITextField!
    @IBOutlet weak var newSubjectCoefficient: UITextField!
    @IBAction func cancelAddSubject(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func saveAddSubject(_ sender: Any) {
        if let subjectName:String = newSubjectName.text,
            let subjectCoefficient:Int = Int(newSubjectCoefficient.text!) {
            if !_myGrades.addSubject(name: subjectName, coefficient: subjectCoefficient) {
                warningSavingSubject(alertText:MyGrades.NEW_SUBJECT_NOT_SAVED)
            } else {
                dismiss(animated: true, completion: nil)
            }
        } else {
            warningSavingSubject(alertText:"You need to input the required parameters.")
        }
    }
    private func warningSavingSubject(alertText:String) {
        let alert = UIAlertController(title: "Problem with saving this new subject!", message: alertText, preferredStyle: UIAlertControllerStyle.alert)
        self.present(alert, animated: true, completion: nil)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        newSubjectName.becomeFirstResponder()
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
