//
//  ExampleAdapter.swift
//  SampleDesignPatterns
//
//  Created by Santhosh Nampally on 03/08/18.
//  Copyright © 2018 Santhosh Nampally. All rights reserved.
//

import Foundation

//MARK:- Third Party Class

class ThirdParty {
    func getTheData() -> Data {
        return Data()
    }
}

//MARK:- Adapter Interface and class

protocol PThirdPartyAdapter {
    func getTheData() -> [String]
}

class Adapter: PThirdPartyAdapter {
    func getTheData() -> [String] {
        _ = ThirdParty().getTheData()
        
        return []
    }
}

//MARK:- Client Class

class Client {
    
    let adapter: PThirdPartyAdapter
    
    init(adapter:PThirdPartyAdapter) {
        self.adapter = adapter
    }
    
    func updateTheDate() {
        _ = adapter.getTheData()
    }
}

