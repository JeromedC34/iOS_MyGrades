//
//  Mark.swift
//  iOS_MyGrades
//
//  Created by imac on 21/11/2016.
//  Copyright © 2016 imac. All rights reserved.
//

import Foundation
import RealmSwift

class Mark:Object {
    private dynamic var _value:Float = 0
    private dynamic var _coefficient:Int = 0
    private dynamic var _date:Date = Date()
    private dynamic var _name:String = ""
    public func getValue() -> Float {
        return _value
    }
    public func getCoefficient() -> Int {
        return _coefficient
    }
    public func getDate() -> Date {
        return _date
    }
    public func getName() -> String {
        return _name
    }
    public func setValue(newValue:Float) {
        if newValue >= 0 {
            realm?.beginWrite()
            self._value = newValue
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
    public func setDate(newValue:Date) {
        realm?.beginWrite()
        self._date = newValue
        try! realm?.commitWrite()
    }
    public func setName(newValue:String) {
        if newValue.characters.count > 0 {
            realm?.beginWrite()
            self._name = newValue
            try! realm?.commitWrite()
        }
    }
    convenience init?(value:Float, coefficient:Int, date:Date, name:String) {
        if value >= 0 && coefficient > 0 {
            self.init()
            _value = value
            _coefficient = coefficient
            _date = date
            _name = name
        } else {
            return nil
        }
    }
    override static func ignoredProperties() -> [String] {
        return ["value", "coefficient", "date", "name"]
    }
}
