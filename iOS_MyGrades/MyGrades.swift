//
//  MyGrades.swift
//  iOS_MyGrades
//
//  Created by imac on 21/11/2016.
//  Copyright © 2016 imac. All rights reserved.
//

import Foundation
import RealmSwift

class MyGrades {
    private static var _instance:MyGrades?
    private var _subjectsList:Results<Subject>
    private let _realm:Realm

    public static let NEW_SUBJECT_NOT_SAVED:String = "You cannot add a subject with an already existing name."
    public static var instance:MyGrades {
        if MyGrades._instance == nil {
            MyGrades._instance = MyGrades()
        }
        return MyGrades._instance!
    }
    var subjectsList:Results<Subject> {
        return _subjectsList
    }
    var realm:Realm {
        return _realm
    }
    
    func eraseAll() {
        try! _realm.write {
            _realm.deleteAll()
        }
        _subjectsList = _realm.objects(Subject.self)
    }
    private init() {
        // Get the default Realm
        // Inside your application(application:didFinishLaunchingWithOptions:)
        
        let config = Realm.Configuration(
            // Set the new schema version. This must be greater than the previously used
            // version (if you've never set a schema version before, the version is 0).
            schemaVersion: 2,
            
            // Set the block which will be called automatically when opening a Realm with
            // a schema version lower than the one set above
            migrationBlock: { migration, oldSchemaVersion in
                // We haven’t migrated anything yet, so oldSchemaVersion == 0
                if (oldSchemaVersion < 2) {
                    // Nothing to do!
                    // Realm will automatically detect new properties and removed properties
                    // And will update the schema on disk automatically
                }
        })
        
        // Tell Realm to use this new configuration object for the default Realm
        Realm.Configuration.defaultConfiguration = config

        _realm = try! Realm()
        print(_realm.configuration.fileURL!)
        // Query Realm for all subjects
        _subjectsList = _realm.objects(Subject.self)
    }
    func addSubject(subject:Subject) -> Bool {
        let mayAdd:Bool = _subjectsList.index(of: subject) == nil
        if mayAdd {
            try! _realm.write {
                _realm.add(subject)
            }
        }
        return mayAdd
    }
    func addSubject(name:String, coefficient:Int) -> Bool {
        if let subject = Subject(name: name, coefficient: coefficient) {
            return addSubject(subject: subject)
        } else {
            return false
        }
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
                return ((100 * sumAverages / Float(sumCoefficients))).rounded() / 100
            } else {
                return nil
            }
        } else {
            return nil
        }
    }
    func getNbSubjects() -> Int {
        return _subjectsList.count
    }
}
