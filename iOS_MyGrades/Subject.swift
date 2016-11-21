//
//  Subject.swift
//  iOS_MyGrades
//
//  Created by imac on 21/11/2016.
//  Copyright © 2016 imac. All rights reserved.
//

import Foundation

class Subject {
    public static let NO_NOTE_YET:String = "No note yet"
    private var _name:String
    var name:String {
        return _name
    }
    private var _marksList:[Mark]
    var marksList:[Mark] {
        return _marksList
    }
    init(name:String) {
        _name = name
        _marksList = []
    }
    public func addMark(newMark:Mark) {
        _marksList.append(newMark)
    }
    public func getAverage() -> Float? {
        if _marksList.count > 0 {
            var sumCoefficients:Int = 0
            var sumMarks:Float = 0
            for mark in _marksList {
                sumCoefficients = sumCoefficients + mark.coefficient
                sumMarks = sumMarks + (mark.value * Float(mark.coefficient))
            }
            return sumMarks / Float(sumCoefficients)
        } else {
            return nil
        }
    }
}
