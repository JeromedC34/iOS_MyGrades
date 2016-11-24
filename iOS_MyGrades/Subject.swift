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
    private dynamic var _coefficient:Int = 0
    public func getName() -> String {
        return _name
    }
    
    public func getCoefficient() -> Int {
        return _coefficient
    }
    
    public func setName(newValue:String) {
        if newValue != "" {
            realm?.beginWrite()
            self._name = newValue
            try! realm?.commitWrite()
        }
    }
    
    public func setCoefficient(newValue:Int) {
        if newValue > 0 {
            realm?.beginWrite()
            self._coefficient = newValue
            try! realm?.commitWrite()
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
        return ["marksList"]
    }
    public static func == (subject1:Subject, subject2:Subject) -> Bool{
        return subject1.getName() == subject2.getName()
    }
    public func addMark(newMark:Mark) {
        try! self.realm?.write {
            marksList.append(newMark)
        }
    }
    public func addMark(value:Float, coefficient:Int, date:Date, name:String) {
        if let newMark = Mark(value: value, coefficient: coefficient, date: date, name: name) {
            return addMark(newMark:newMark)
        }
    }
    public func delMark(atIndex:Int) {
        try! self.realm?.write {
            marksList.remove(objectAtIndex: atIndex)
        }
    }
    public func removeAllMarks() {
        if let r = realm {
            try! r.write {
                r.delete(_marksList)
            }
        } else {
            _marksList.removeAll()
        }
    }
    public func delete() {
        removeAllMarks()
        if let r = realm {
            try! r.write {
                r.delete(self)
            }
        }
    }
    public func updateMark(existingMark:Mark, updatedMark:Mark) {
        try! self.realm?.write {
            existingMark.setValue(newValue: updatedMark.getValue())
            existingMark.setCoefficient(newValue: updatedMark.getCoefficient())
            existingMark.setDate(newValue: updatedMark.getDate())
            existingMark.setName(newValue: updatedMark.getName())
        }
    }
    public func getAverage() -> Float? {
        if _marksList.count > 0 {
            var sumCoefficients:Int = 0
            var sumMarks:Float = 0
            for mark in _marksList {
                sumCoefficients = sumCoefficients + mark.getCoefficient()
                sumMarks = sumMarks + (mark.getValue() * Float(mark.getCoefficient()))
            }
            return ((100 * sumMarks / Float(sumCoefficients))).rounded() / 100
        } else {
            return nil
        }
    }
    func getNbMarks() -> Int {
        return _marksList.count
    }
    func getMark(atIndex index:Int) -> Mark? {
        let mark:Mark?
        if index >= 0 && index < _marksList.count {
            mark = _marksList[index]
        } else {
            mark = nil
        }
        return mark
    }
}
