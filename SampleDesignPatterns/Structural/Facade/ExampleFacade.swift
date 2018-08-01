//
//  ExampleFacade.swift
//  SampleDesignPatterns
//
//  Created by Santhosh Nampally on 01/08/18.
//  Copyright © 2018 Santhosh Nampally. All rights reserved.
//

import Foundation

// Sample scenario for the banking system with customer interaction

// MARK:- Multiple instances for a Client
protocol PAccount {
    func action()
}

class Chequing: PAccount {
    func action() {
        
    }
}

class Saving: PAccount {
    func action() {
        
    }
}

class Investment: PAccount {
    func action() {
        
    }
}

//MARK:- Facade Interface for the Multiple instance for a Client

class Bank {
    private let chequing: Chequing = Chequing()
    private let saving: Saving = Saving()
    private let investment: Investment = Investment()
    
    func doActionFor(type:String){
        switch  type{
        case "Chequing":
            chequing.action()
        case "Saving":
            saving.action()
        case "Investment":
            investment.action()
        default: break
        }
    }
}

//MARK:- Client Class

class Customer {
    let bankAccount:Bank
    
    init(account:Bank) {
        bankAccount = account
    }
    
    func actionForSavings() {
        bankAccount.doActionFor(type: "Saving")
    }
}
