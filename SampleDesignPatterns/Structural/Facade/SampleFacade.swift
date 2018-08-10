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
    func deposit(amount:Double)
    func withdraw(amount:Double)
    func transfer(amount:Double)
}

class Chequing: PAccount {
    func deposit(amount: Double) {
        
    }
    
    func withdraw(amount: Double) {
        
    }
    
    func transfer(amount: Double) {
        
    }
    
}

class Saving: PAccount {
    func deposit(amount: Double) {
        
    }
    
    func withdraw(amount: Double) {
        
    }
    
    func transfer(amount: Double) {
        
    }
    
}

class Investment: PAccount {
    func deposit(amount: Double) {
        
    }
    
    func withdraw(amount: Double) {
        
    }
    
    func transfer(amount: Double) {
        
    }
    
}

//MARK:- Facade Interface for the Multiple instance for a Client

class Bank {
    
    func createNewAccount(type:String) -> PAccount{
        switch  type{
        case "Chequing":
            return Chequing()
        case "Saving":
            return Saving()
        case "Investment":
            return Investment()
        default: break
        }
        
        return Saving()
    }
    
    func transferMoney(account1:PAccount,account2:PAccount,amount:Double){
        account1.transfer(amount: amount)
        account2.deposit(amount: amount)
    }
}

//MARK:- Client Class

class Customer {
    let bankAccount:Bank
    
    init(account:Bank) {
        bankAccount = account
    }
    
    func moneyTransaction() {
        let savingsAccount = bankAccount.createNewAccount(type: "Saving")
        let InvestmentAccount = bankAccount.createNewAccount(type: "Investment")
        bankAccount.transferMoney(account1: savingsAccount, account2: InvestmentAccount, amount: 1000)
    }
}
