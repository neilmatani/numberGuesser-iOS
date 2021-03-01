//
//  userSession.swift
//  numberGuesser
//
//  Created by Neil Matani on 17/1/21.
//

import Foundation

struct userSession{
    var userName: String?
    var lives: Int = 5
    let targetNumber = Int.random(in: 1..<100)
    
    mutating func removeLife(){
        lives = lives - 1
    }
    
    init(userName: String? = nil){
        self.userName = userName
    }
    
}
