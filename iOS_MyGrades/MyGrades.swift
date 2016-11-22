//
//  MyGrades.swift
//  iOS_MyGrades
//
//  Created by imac on 21/11/2016.
//  Copyright © 2016 imac. All rights reserved.
//

import Foundation

class MyGrades {
    public static let NEW_SUBJECT_NOT_SAVED:String = "You cannot add a subject with an already existing name."
    private static var _instance:MyGrades?
    var instance:MyGrades {
        if MyGrades._instance == nil {
            MyGrades._instance = MyGrades()
        }
        return MyGrades._instance!
    }
    private var _subjectsList:[Subject]
    var subjectsList:[Subject] {
        return _subjectsList
    }
    private init() {
        _subjectsList = []
    }
    func addSubject(subject:Subject) -> Bool {
        let mayAdd:Bool = _subjectsList.index(of: subject) == nil
        if mayAdd {
            _subjectsList.append(subject)
        }
        return mayAdd
    }
    func getAverage() -> Float? {
        if _subjectsList.count > 0 {
            var sumCoefficients:Int = 0
            var sumAverages:Float = 0
            for subject in _subjectsList {
                if let currentAverage = subject.getAverage() {
                    sumCoefficients = sumCoefficients + subject.coefficient
                    sumAverages = sumAverages + (currentAverage * Float(subject.coefficient))
                }
            }
            if sumCoefficients > 0 {
                return sumAverages / Float(sumCoefficients)
            } else {
                return nil
            }
        } else {
            return nil
        }
    }
}
