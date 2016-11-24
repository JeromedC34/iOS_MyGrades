//
//  iOS_MyGradesTests.swift
//  iOS_MyGradesTests
//
//  Created by imac on 21/11/2016.
//  Copyright © 2016 imac. All rights reserved.
//

import XCTest
import RealmSwift
@testable import iOS_MyGrades

class iOS_MyGradesTests: XCTestCase {
    var subject:Subject!
    var realm:Realm!
    override func setUp() {
        super.setUp()
        realm = try! Realm(configuration: Realm.Configuration(inMemoryIdentifier: self.name))
        
        subject = Subject()
        try! realm.write {
            realm.add(subject)
        }
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testSubjectTitle() {
        // This is an example of a functional test case.
        XCTAssertEqual(subject.getName(), "")
        subject.setName(newValue: "Maths")
        XCTAssertEqual(subject.getName(), "Maths")
        subject.setName(newValue: "")
        XCTAssertEqual(subject.getName(), "Maths")
    }
    
    func testMarkManagement() {
        XCTAssertEqual(subject.getNbMarks(), 0)
        subject.addMark(value:10, coefficient:1, date:Date(), name:"")
        XCTAssertEqual(subject.getNbMarks(), 1)
        subject.addMark(value:-2, coefficient:1, date:Date(), name:"")
        XCTAssertEqual(subject.getNbMarks(), 1)
        subject.addMark(value:14, coefficient:0, date:Date(), name:"")
        XCTAssertEqual(subject.getNbMarks(), 1)
        subject.addMark(value:14, coefficient:-1, date:Date(), name:"")
        XCTAssertEqual(subject.getNbMarks(), 1)
        subject.addMark(value:20, coefficient:1, date:Date(), name:"")
        XCTAssertEqual(subject.getNbMarks(), 2)
        XCTAssertEqual(subject.getAverage(), 15)
        subject.addMark(value:1, coefficient:2, date:Date(), name:"")
        XCTAssertEqual(subject.getAverage(), 8)
    }
    
    func testGetMark() {
        XCTAssertNil(subject.getMark(atIndex: 0))
        subject.addMark(value:10, coefficient:2, date:Date(), name:"")
        let firstMark = subject.getMark(atIndex:0)
        XCTAssertNotNil(firstMark)
        XCTAssertEqual(firstMark!.getValue(), 10)
        XCTAssertEqual(firstMark!.getCoefficient(), 2)
        XCTAssertNil(subject.getMark(atIndex: -1))
        XCTAssertNil(subject.getMark(atIndex: 1))
        subject.addMark(value:8, coefficient:2, date:Date(), name:"")
        XCTAssertNotNil(subject.getMark(atIndex: 1))
    }
    
    func testDeleteSubject() {
        XCTAssertEqual(1, realm.objects(Subject.self).count)
        XCTAssertEqual(0, realm.objects(Mark.self).count)
        subject.addMark(value:10, coefficient:1, date:Date(), name:"")
        XCTAssertEqual(1, realm.objects(Mark.self).count)
        subject.delete()
        XCTAssertEqual(0, realm.objects(Subject.self).count)
        XCTAssertEqual(0, realm.objects(Mark.self).count)
    }
    
    func testEmptyMarkList() {
        XCTAssertNil(subject.getAverage())
    }

    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
