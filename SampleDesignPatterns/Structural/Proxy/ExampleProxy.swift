//
//  ExampleProxy.swift
//  SampleDesignPatterns
//
//  Created by Santhosh Nampally on 06/08/18.
//  Copyright © 2018 Santhosh Nampally. All rights reserved.
//

import Foundation

//MARK:- Interface for the Consumers

protocol POrder: class {
    func fullFillOrder(product:String)
}

//MARK:- Real Objects classes

class Warehouse: POrder {
    
    func fullFillOrder(product: String) {
        
    }
    
    func currentInventory(item:String) -> Int {
        return 1
    }
}

//MARK:- Proxy for the real objects

class Proxy: POrder {
    
    private var wareHouseList:[Warehouse] = []
    
    func fullFillOrder(product: String) {
        for house in wareHouseList {
            if (house.currentInventory(item: product) > 0) {
                house.fullFillOrder(product: product)
                break
            }
        }
    }
}

//MARK:- Client classes

class Consumer  {
    let productOwner: Proxy?
    
    init(owner:Proxy) {
        productOwner = owner
    }
    
    func requestForTheProduct(product:String) {
        productOwner?.fullFillOrder(product: product)
    }
}

