//
//  AddSubjectViewController.swift
//  iOS_MyGrades
//
//  Created by imac on 21/11/2016.
//  Copyright © 2016 imac. All rights reserved.
//

import UIKit

class AddSubjectViewController: UIViewController {
    @IBOutlet weak var newSubjectName: UITextField!
    private var _myGrades:MyGrades?
    var myGrades:MyGrades {
        get {
            return _myGrades!
        }
        set {
            _myGrades = newValue
        }
    }

    @IBAction func cancelAddSubject(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func saveAddSubject(_ sender: Any) {
        if let currentMyGrades = _myGrades,
            let subjectName:String = newSubjectName.text {
            let newSubject:Subject = Subject(name: subjectName)
            if !currentMyGrades.addSubject(subject: newSubject) {
                // manage error
                let alert = UIAlertController(title: "Subject already exists!", message: "You cannot add a subject with an already existing name.", preferredStyle: UIAlertControllerStyle.alert)
                self.present(alert, animated: true, completion: nil)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            } else {
                dismiss(animated: true, completion: nil)
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        newSubjectName.becomeFirstResponder()

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
