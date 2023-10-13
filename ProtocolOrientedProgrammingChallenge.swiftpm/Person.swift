//
//  Person.swift
//  ProtocolOrientedProgrammingChallenge
//
//  Created by Pedro henrique Dias hemmel de oliveira souza on 13/10/23.
//

protocol PersonProtocol {
    func payForIt(price: Int) async -> String
}

import Foundation

class Person: PersonProtocol {
    let name: String
    private var money: Double
    
    init(name: String, money: Double) {
        self.name = name
        self.money = money
    }
    
    func payForIt(price: Int) async -> String {
        let money = await countMoney(price: price) ?? -1
        
        if money != -1 {
            self.money = self.money - Double(money)
            print(self.money)
            return "Paying in cash"
        }
        return "I cannot pay for it"
    }
    
    func countMoney(price: Int) async -> Int? {
        var count = 0
        for _ in 0...(price - 1) {
            count += 1
            if count > Int(self.money) {
                print("I cannot pay for it")
                return nil
            }
        }
        
        return count
    }
}
