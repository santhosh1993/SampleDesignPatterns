//
//  SampleTemplateMethodPattern.swift
//  SampleDesignPatterns
//
//  Created by Santhosh Nampally on 10/08/18.
//  Copyright © 2018 Santhosh Nampally. All rights reserved.
//

import Foundation

//MARK:- Template method classes

// Generalising the work steps

class Gereralisation {
    func completeTheWork() {
        stepOne()
        stepTwo()
        stepThree()
        stepFour()
    }
    
    func stepOne() {
        
    }
    
    func stepTwo() {
        
    }
    
    func stepThree() {
        
    }
    
    func stepFour() {
        
    }
    
    init() {
        fatalError("its an abstact class")
    }
}

// Completing the work in the respective steps

class Specialization: Gereralisation {
    override init() {
        
    }
    
    override func stepOne() {
        
    }
    
    override func stepTwo() {
        
    }
    
    override func stepThree() {
        
    }
    
    override func stepFour() {
        
    }
}

//MARK:- Consuming the Template method classes

class User {
    func completeTheWork() {
        let skill = Specialization()
        skill.completeTheWork()
    }
}
