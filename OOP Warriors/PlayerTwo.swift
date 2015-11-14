//
//  PlayerTwo.swift
//  OOP Warriors
//
//  Created by James Gobert on 11/12/15.
//  Copyright © 2015 EverydayDigitals. All rights reserved.
//

import Foundation

class PlayerTwo: Character {
    private var _name = "Player 2"
    
    var name: String {
        get {
            return _name
        }
    }
    
    convenience init(name: String, hp: Int, attackPwr: Int) {
        self.init(startingHealth: hp, attackPwr: attackPwr)
        
        _name = name
    }
    
}
