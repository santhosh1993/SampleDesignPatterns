//
//  SampleChainofResponsibilityPattern.swift
//  SampleDesignPatterns
//
//  Created by Santhosh Nampally on 29/08/18.
//  Copyright © 2018 Santhosh Nampally. All rights reserved.
//

import Foundation

class Request {
    let value:Int
    
    init(_ value:Int) {
        self.value = value
    }
}

protocol PRequest {
    func process(request:Request) -> Bool
}

class Handler: PRequest {
    func process(request:Request) -> Bool {
        return true
    }
}

class Chain  {
    let handlers = [Handler(),Handler(),Handler(),Handler()];
    
    func performTheRequest(request:Request) -> Bool{
        var  requestCompleted = false
        var i = 0
        while (!requestCompleted && i < handlers.count) {
            requestCompleted = handlers[i].process(request: request)
            i = i + 1
        }
        
        return requestCompleted
    }
}

class ChainDemo {
    func processTheRequest() {
        _ = Chain().performTheRequest(request: Request(1))
    }
}
