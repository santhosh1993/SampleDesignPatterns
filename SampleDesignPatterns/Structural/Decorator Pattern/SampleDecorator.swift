//
//  SampleDecorator.swift
//  SampleDesignPatterns
//
//  Created by Santhosh Nampally on 10/08/18.
//  Copyright © 2018 Santhosh Nampally. All rights reserved.
//

import Foundation

//MARK:- Interface for utilising Webpage

protocol PWebPage {
    func display()
}

//MARK:- Base Classes

class WebPage: PWebPage {
    
    private var htmlStr: String?
    
    func display() {
        print("WebPage")
    }
}

//MARK:- Decorator classes

class WebPageDecorater: PWebPage {
    let page:PWebPage
    
    init(webPage:PWebPage) {
        page = webPage
    }
    
    func display() {
        page.display()
    }
}

class AutherisedWebPage: WebPageDecorater {
    override init(webPage: PWebPage) {
        super.init(webPage: webPage)
    }
    
    override func display() {
        super.display()
        autheriseUser()
    }
    
    func autheriseUser(){
        print("AutherisedWebPage")
    }
}

class AuthenticatedWebPage: WebPageDecorater {
    override init(webPage: PWebPage) {
        super.init(webPage: webPage)
    }
    
    override func display() {
        super.display()
        authenticatedUser()
    }
    
    func authenticatedUser() {
        print("AuthenticatedWebPage")
    }
}

//MARK:- Sample Usage

/*
 page display traverse through AutherisedWebPage -> AuthenticatedWebPage -> WebPage So all the functionalities can be incorporated on page.
 */

class Program {
    func updateTheWebPage() {
        var page: PWebPage = WebPage()
        page = AuthenticatedWebPage(webPage: page)
        page = AutherisedWebPage(webPage: page)
        
        page.display()
    }
}
