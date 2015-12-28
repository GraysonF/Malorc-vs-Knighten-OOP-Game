//
//  Character.swift
//  Soldier-VS-Orc-Game
//
//  Created by Grayson faircloth on 12/27/15.
//  Copyright © 2015 Grayson Faircloth. All rights reserved.
//

import Foundation

class Character {
    
    private var _hp: Int = 100
    private var _attackPower: Int = 20
    private var _name: String = "Player"
    
    var attackPower: Int {
        get {
            return _attackPower
        }
    }
    
    var hp: Int {
        get {
            return _hp
            
        }
    }
    
    
    
    var name: String {
        get {
            return _name
        }
    }
    
  
    
    init (name: String, startingHp: Int, attackPower: Int) {
        self._name = name
        self._hp = startingHp
        self._attackPower = attackPower
    }
    
    
    func attemptAttack(attackPower: Int) -> Bool {
        self._hp -= attackPower
        
        return true
    }
        
    var isAlive: Bool {
        get {
            if hp <= 0 {
                return false
            }
            else {
                return true
            }
        }
    }
    
}