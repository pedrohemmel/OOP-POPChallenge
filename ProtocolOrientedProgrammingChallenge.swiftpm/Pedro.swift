//
//  Pedro.swift
//  ProtocolOrientedProgrammingChallenge
//
//  Created by Pedro henrique Dias hemmel de oliveira souza on 13/10/23.
//

import Foundation

class Pedro: Person {
    private var pixMoney: Double
    
    override init(name: String, money: Double) {
        self.pixMoney = money
        super.init(name: name, money: 0)
    }
    
    override func payForIt(price: Int) async -> String {
        let money = await countMoney(price: price) ?? -1
        
        if money != -1 {
            self.pixMoney = self.pixMoney - Double(money)
            print(pixMoney)
            return "Paying in pix"
        }
        return "I cannot pay for it"
    }
    
    override func countMoney(price: Int) async -> Int? {
        var count = 0
        for _ in 0...(price - 1) {
            count += 1
            if count > Int(self.pixMoney) {
                print("I cannot pay for it")
                return nil
            }
        }
        
        return count
    }
}
