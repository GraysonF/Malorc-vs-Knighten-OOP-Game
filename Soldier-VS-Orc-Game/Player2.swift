//
//  Player2.swift
//  Soldier-VS-Orc-Game
//
//  Created by Grayson faircloth on 12/27/15.
//  Copyright © 2015 Grayson Faircloth. All rights reserved.
//

import Foundation

class Player2: Character {
    
    private var _name2: String = "Player 2"
    
    var name2: String {
        get {
            return _name2
        }
    }
    
    convenience init(name2: String, hp: Int, attackPower: Int) {
        self.init(startingHp: hp, attackPower: attackPower )
        
        _name2 = name2
    }
    
    
    
    }