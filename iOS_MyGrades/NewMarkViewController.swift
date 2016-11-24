//
//  NewMarkViewController.swift
//  iOS_MyGrades
//
//  Created by imac on 21/11/2016.
//  Copyright © 2016 imac. All rights reserved.
//

import UIKit

class NewMarkViewController: UIViewController {
    private var _mySubject:Subject?
    var mySubject:Subject {
        get {
            return _mySubject!
        }
        set {
            _mySubject = newValue
        }
    }
    private var _myMark:Mark?
    var myMark:Mark {
        get {
            return _myMark!
        }
        set {
            _myMark = newValue
        }
    }

    @IBAction func cancelNewMark(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var uiNewMarkValue: UITextField!
    @IBOutlet weak var uiNewMarkCoefficient: UITextField!
    @IBOutlet weak var uiNewMarkDate: UIDatePicker!
    @IBOutlet weak var uiNewMarkName: UITextField!
    @IBAction func saveNewMark(_ sender: Any) {
        let newMarkDate:Date = uiNewMarkDate.date
        if let currentMySubject = _mySubject,
            let newMarkValue:Float = Float(uiNewMarkValue.text!),
            let newMarkCoefficient:Int = Int(uiNewMarkCoefficient.text!),
            let newMarkName:String = uiNewMarkName.text {
            if let newMark = Mark(value:newMarkValue, coefficient:newMarkCoefficient, date:newMarkDate, name:newMarkName) {
                if let myMark = _myMark {
                    myMark.setValue(newValue: newMarkValue)
                    myMark.setCoefficient(newValue: newMarkCoefficient)
                    myMark.setDate(newValue: newMarkDate)
                    myMark.setName(newValue: newMarkName)
                } else {
                    currentMySubject.addMark(newMark: newMark)
                }
            }
            dismiss(animated: true, completion: nil)
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        if let myMark = _myMark {
            uiNewMarkValue.text = String(myMark.getValue())
            uiNewMarkCoefficient.text = String(myMark.getCoefficient())
            uiNewMarkDate.date = myMark.getDate()
            uiNewMarkName.text = myMark.getName()
        }
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
