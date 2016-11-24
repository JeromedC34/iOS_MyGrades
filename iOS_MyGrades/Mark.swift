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
    var value:Float {
        get {
            return _value
        }
        set {
            _value = newValue
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
    private dynamic var _date:Date = Date()
    var date:Date {
        get {
            return _date
        }
        set {
            _date = newValue
        }
    }
    private dynamic var _name:String = ""
    var name:String {
        get {
            return _name
        }
        set {
            _name = newValue
        }
    }
    convenience init(value:Float, coefficient:Int, date:Date, name:String) {
        self.init()
        _value = value
        _coefficient = coefficient
        _date = date
        _name = name
    }
    override static func ignoredProperties() -> [String] {
        return ["value", "coefficient", "date", "name"]
    }
}
