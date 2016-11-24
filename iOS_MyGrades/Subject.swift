//
//  Subject.swift
//  iOS_MyGrades
//
//  Created by imac on 21/11/2016.
//  Copyright © 2016 imac. All rights reserved.
//

import Foundation
import RealmSwift

class Subject:Object {
    public static let NO_NOTE_YET:String = "No note yet"
    public static let BAD_PARAMETERS:String = "Subject name must not be empty and coefficient greater than zero"
    private dynamic var _name:String = ""
    var name:String {
        get {
            return _name
        }
        set {
            _name = newValue
        }
    }
    private dynamic var _coefficient:Int = 0
    var coefficient:Int {
        get {
            return _coefficient
        }
        set {
            _coefficient = newValue
        }
    }
    private var _marksList:List<Mark> = List<Mark>()
    var marksList:List<Mark> {
        get {
            return _marksList
        }
        set {
            _marksList = newValue
        }
    }
    convenience init?(name:String, coefficient:Int) {
        self.init()
        if name.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines) == "" || coefficient <= 0 {
            return nil
        } else {
            _name = name.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines)
            _coefficient = coefficient
            _marksList = List<Mark>()
        }
    }
    override static func ignoredProperties() -> [String] {
        return ["name", "coefficient", "marksList"]
    }
    public static func == (subject1:Subject, subject2:Subject) -> Bool{
        return subject1.name == subject2.name
    }
    public func addMark(newMark:Mark) {
        try! self.realm?.write {
            marksList.append(newMark)
        }
    }
    public func delMark(atIndex:Int) {
        try! self.realm?.write {
            marksList.remove(objectAtIndex: atIndex)
        }
    }
    public func updateMark(existingMark:Mark, updatedMark:Mark) {
        try! self.realm?.write {
            existingMark.value = updatedMark.value
            existingMark.coefficient = updatedMark.coefficient
            existingMark.date = updatedMark.date
            existingMark.name = updatedMark.name
        }
    }
    public func getAverage() -> Float? {
        if _marksList.count > 0 {
            var sumCoefficients:Int = 0
            var sumMarks:Float = 0
            for mark in _marksList {
                sumCoefficients = sumCoefficients + mark.coefficient
                sumMarks = sumMarks + (mark.value * Float(mark.coefficient))
            }
            return ((100 * sumMarks / Float(sumCoefficients))).rounded() / 100
        } else {
            return nil
        }
    }
    func getNbMarks() -> Int {
        return _marksList.count
    }
    func getMark(atIndex:Int) -> Mark {
        return _marksList[atIndex]
    }
}
