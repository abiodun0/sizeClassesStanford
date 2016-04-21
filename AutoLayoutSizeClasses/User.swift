//
//  User.swift
//  AutoLayoutSizeClasses
//
//  Created by Abiodun Shuaib on 20/04/2016.
//  Copyright © 2016 Abiodun Shuaib. All rights reserved.
//

import Foundation

struct User {
    let name: String
    let company: String
    let login: String
    let password: String
    
    static func login(login:String, password:String) -> User?{
        if let user = database[login]{
            if user.password == password {
                return user
            }
        }
        return nil
    }
    static let database: Dictionary<String, User>= {
        var theDatabase = [String:User]()
        for user in [User(name: "Abiodun", company: "Apple", login: "abbey", password: "1234"),
        User(name: "Femi", company: "cabal", login: "femi", password: "1234"),
        User(name: "Sayo", company: "microsoft", login: "sayo", password: "1234")]{
            theDatabase[user.login] = user
        }
        return theDatabase
    }()
}
