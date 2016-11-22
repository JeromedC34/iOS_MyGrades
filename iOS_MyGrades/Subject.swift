//
//  Subject.swift
//  iOS_MyGrades
//
//  Created by imac on 21/11/2016.
//  Copyright © 2016 imac. All rights reserved.
//

import Foundation

class Subject:Equatable {
    public static let NO_NOTE_YET:String = "No note yet"
    public static let BAD_PARAMETERS:String = "Subject name must not be empty and coefficient greater than zero"
    private var _name:String
    var name:String {
        return _name
    }
    private var _coefficient:Int
    var coefficient:Int {
        return _coefficient
    }
    private var _marksList:[Mark]
    var marksList:[Mark] {
        return _marksList
    }
    init?(name:String, coefficient:Int) {
        if name.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines) == "" || coefficient <= 0 {
            return nil
        } else {
            _name = name.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines)
            _coefficient = coefficient
            _marksList = []
        }
    }
    public static func == (subject1:Subject, subject2:Subject) -> Bool{
        return subject1.name == subject2.name
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
