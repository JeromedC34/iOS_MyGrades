//
//  Mark.swift
//  iOS_MyGrades
//
//  Created by imac on 21/11/2016.
//  Copyright © 2016 imac. All rights reserved.
//

import Foundation

class Mark {
    private var _value:Float
    var value:Float {
        return _value
    }
    private var _coefficient:Int
    var coefficient:Int {
        return _coefficient
    }
    private var _date:Date
    var date:Date {
        return _date
    }
    private var _name:String
    var name:String {
        return _name
    }
    init(value:Float, coefficient:Int, date:Date, name:String) {
        _value = value
        _coefficient = coefficient
        _date = date
        _name = name
    }
}
