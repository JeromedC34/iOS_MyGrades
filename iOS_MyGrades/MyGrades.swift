//
//  MyGrades.swift
//  iOS_MyGrades
//
//  Created by imac on 21/11/2016.
//  Copyright © 2016 imac. All rights reserved.
//

import Foundation

class MyGrades {
    private var _subjectsList:[Subject] = [Subject(name: "Français"), Subject(name: "Mathématiques")]
    var subjectsList:[Subject] {
        return _subjectsList
    }
    public func addSubject(subject:Subject) -> Bool {
        var mayAdd:Bool = true
        for aSubject in _subjectsList {
            if aSubject.name == subject.name {
                mayAdd = false
            }
        }
        if mayAdd {
            _subjectsList.append(subject)
        }
        return mayAdd
    }
}
