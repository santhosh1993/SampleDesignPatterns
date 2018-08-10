//
//  ExampleFactory.swift
//  SampleDesignPatterns
//
//  Created by Santhosh Nampally on 31/07/18.
//  Copyright © 2018 Santhosh Nampally. All rights reserved.
//

import Foundation

/**
    Sample scenario is for a kinfe Store.
 
    Store can have multiple varient of knifes. Lets categorise them into two major varients
    1. Budget
    2. Quality
 
    So now our KnifeFactory sould be capable of creating a knife objects according to the requirements speceified. So, we have subclassed KnifeFactory to BudjetKnifeFactory and QualityKnifeFactory. As we have mentioned its a fatalerror method, so the subclasses has to overide those methods to add there respective functionality. By this we have divided the concrete creational to factory creational pattern.
 
    We get advatege in long run if there is any change in initialisation only the factory menthod will change as all creation is happening at only factory.
 */

//MARK:- Product Classes

class Knife {
    func sharpen(){
        fatalError("Sub class has to implement this")
    }
    
    func polish() {
        fatalError("Sub class has to implement this")
    }
    
    func qualityAssurance() {
        fatalError("Sub class has to implement this")
    }
}

class BudgetKnife: Knife {
    
    var qualityLevel:Int
    
    init(qualityLevel: Int) {
        self.qualityLevel = qualityLevel
    }
    
    override func sharpen() {
        
    }
    
    override func polish() {
        
    }
    
    override func qualityAssurance() {
        
    }
}

class QualityKnife: Knife {
    
    var width:Int
    
    init(width: Int) {
        self.width = width
    }
    
    override func sharpen() {
        
    }
    
    override func polish() {
        
    }
    
    override func qualityAssurance() {
        
    }
}

//MARK:- Factory Classes

class KnifeFactory {
    func createKinfe(type:String) -> Knife {
        fatalError("Sub class has to implement this")
    }
}

class BudgetKnifeFactory: KnifeFactory {
    override func createKinfe(type: String) -> Knife {
        switch type {
        case "type1":
            return BudgetKnife(qualityLevel: 1)
        default:
            return BudgetKnife(qualityLevel: 2)
        }
    }
}

class QualityKnifeFactory: KnifeFactory {
    override func createKinfe(type: String) -> Knife {
        switch type {
        case "type1":
            return QualityKnife(width: 1)
        default:
            return QualityKnife(width: 1)
        }
    }
}

//MARK:- Store Class

class Store {
    let factory:KnifeFactory
    
    init(factory:KnifeFactory = BudgetKnifeFactory()) {
        self.factory = factory
    }
    
    func getTheKnife() -> Knife {
        let knife = factory.createKinfe(type: "type1")
        
        knife.sharpen()
        knife.polish()
        knife.qualityAssurance()
        
        return knife
    }
}
