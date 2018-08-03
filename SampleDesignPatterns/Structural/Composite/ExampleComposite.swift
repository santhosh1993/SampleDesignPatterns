//
//  ExampleComposite.swift
//  SampleDesignPatterns
//
//  Created by Santhosh Nampally on 03/08/18.
//  Copyright © 2018 Santhosh Nampally. All rights reserved.
//

import Foundation

// MARK:- Composite interface

protocol PStructure {
    func enter()
    func exit()
    func location()
    func getName() -> String
}

// Mark:- Composite node

class Housing: PStructure {
    
    var structures:[PStructure] = []
    
    func enter() {
        
    }
    
    func exit() {
        
    }
    
    func location() {
        
    }
    
    func getName() -> String {
        return "Housing"
    }
    
    func addStructure(structure:PStructure) {
        structures.append(structure)
    }
    
    func getStructure(level:Int) -> PStructure? {
        return structures[level]
    }
}

// MARK:- Leaf node

class Room: PStructure {
    func enter() {
        
    }
    
    func exit() {
        
    }
    
    func location() {
        
    }
    
    func getName() -> String {
        return "Room"
    }
}

//MARK:- Sample

class CompositeSample {
    func housing() {
        let housing = Housing()
        housing.addStructure(structure: Room()) //first room
        housing.addStructure(structure: Room()) //second room
        
        housing.getStructure(level: 0)?.enter()
    }
}
