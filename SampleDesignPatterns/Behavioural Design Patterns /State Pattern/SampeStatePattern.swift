//
//  SampeState.swift
//  SampleDesignPatterns
//
//  Created by Santhosh Nampally on 03/09/18.
//  Copyright © 2018 Santhosh Nampally. All rights reserved.
//

import Foundation

//MARK: Multiple States of a Vendor machine

protocol VendorState {
    func insertDoller(machine:VendingMachine)
    func ejectDoller(machine:VendingMachine)
    func dispense(machine:VendingMachine)
}

class IdleState: VendorState {
    func insertDoller(machine: VendingMachine) {
        machine.setOneDollerState()
    }
    
    func ejectDoller(machine: VendingMachine) {
        
    }
    
    func dispense(machine: VendingMachine) {
        
    }
}

class OneDollerState: VendorState {
    func insertDoller(machine: VendingMachine) {
        machine.doReturnMoney()
        machine.setIdleState()
    }
    
    func ejectDoller(machine: VendingMachine) {
        machine.doReturnMoney()
        machine.setIdleState()
    }
    
    func dispense(machine: VendingMachine) {
        machine.doReleaseProduct()
        (machine.count > 1) ? machine.setIdleState() : machine.setNoStockState()
    }
}

class NoStockState: VendorState {
    func insertDoller(machine: VendingMachine) {
        
    }
    
    func ejectDoller(machine: VendingMachine) {
        
    }
    
    func dispense(machine: VendingMachine) {
        
    }
}

//MARK:- VendingMachine

/*
 Handles multiple states using state variable so the burden of changing state has been divided to the current state.
 */

class VendingMachine  {
 
    var idleState:IdleState = IdleState()
    var oneDollerState: OneDollerState = OneDollerState()
    var noStockState:NoStockState = NoStockState()
    var state: VendorState
    var count: Int
    
    init(totalCount:Int) {
        count = totalCount
        state = (count < 1) ? noStockState : idleState
    }
    
    func setIdleState() {
        state = idleState
    }
    
    func setOneDollerState() {
        state = oneDollerState
    }
    
    func setNoStockState() {
        state = noStockState
    }
    
    func insertDoller() {
        state.insertDoller(machine: self)
    }
    
    func ejectDoller() {
        state.ejectDoller(machine: self)
    }
    
    func dispense() {
        state.dispense(machine: self)
    }
    
    func doReturnMoney() {
        
    }
    
    func doReleaseProduct() {
        count = count - 1
    }
}

//MARK:- Consumer

class  Consumer {
    func buyFromVender(vender: VendingMachine) {
        vender.insertDoller()
        vender.dispense()
    }
}
