//
//  ExampleSingleton.swift
//  SampleDesignPatterns
//
//  Created by Santhosh Nampally on 31/07/18.
//  Copyright © 2018 Santhosh Nampally. All rights reserved.
//

import Foundation

// Type1 using lazy loading
class ExampleSingleton {
    
    private static var sharedInstance: ExampleSingleton?
    
    // Making init private to make sure there is no other way to create an instance of it.
    private init() {
        
    }
    
    // Lazy creation helps to create the instance when it is required

    /**
     Creates if there is no instance created yet for ExampleSingleton class.
     
     :returns: ExampleSingleton sharedInstance
     */
    static func getInstance() -> ExampleSingleton {
        sharedInstance = sharedInstance ?? ExampleSingleton()
        return sharedInstance!
    }
}

// Type2 without lazy loading
class ExampleSingleton2 {
    
    static let sharedInstance: ExampleSingleton2 = ExampleSingleton2()
    
    // Making init private to make sure there is no other way to create an instance of it.
    private init() {
        
    }
}


