import SwiftUI

struct ContentView: View {
    
    @State private var priceToPay = Int.random(in: 1...20)
    @State private var personMsg = String()
    @State private var pedroMsg = String()
    private let person = Person(name: "Jorge", money: 100.0)
    private let pedro = Pedro(name: "Pedro", money: 1500.0)
    
    var body: some View {
        VStack {
            Text("Pedro msg: \(pedroMsg)")
            Button(action: {
                Task {
                    pedroMsg = await pedro.payForIt(price: priceToPay)
                    priceToPay = Int.random(in: 1...20)
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        withAnimation {
                            pedroMsg = String()
                        }
                    }
                }
            }, label: {
                Text("Pedro is gonna pay \(priceToPay) for it")
            })
            
            Text("Person msg: \(personMsg)")
            Button(action: {
                Task {
                    personMsg = await person.payForIt(price: priceToPay)
                    priceToPay = Int.random(in: 1...20)
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        withAnimation {
                            personMsg = String()
                        }
                    }
                }
            }, label: {
                Text("Person is gonna pay \(priceToPay) for it")
            })
        }
    }
}
