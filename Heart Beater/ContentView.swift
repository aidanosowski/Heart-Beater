//
//  ContentView.swift
//  Heart Beater
//
//  Created by Aidan Osowski on 5/5/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var heartBeater = HeartBeater()
    
    var body: some View {
        VStack() {
            Button(action: {
                self.heartBeater.click()
            }) {
                Text("Click me!")
            }
            .padding(10)
            .background(Color.red)
            .foregroundColor(.black)
            
            Text("\(heartBeater.points) hearts")
            
            if heartBeater.heartsPerSecond > 0 {
                Text("\(heartBeater.heartsPerSecond) hearts/s")
            }
            
            List(heartBeater.HeartGenerator) { heartGenerator in
                HStack {
                    VStack(alignment: .leading) {
                        Text(heartGenerator.name)
                        Text("\(heartGenerator.heartsPerSecond) hearts/s")
                        Text("Price: \(heartGenerator.price) hearts")
                    }
                    Spacer()
                    Group {
                        Button(action: {
                            self.heartBeater.purchase(pointGenerator: heartGenerator)
                        }) {
                            Text("Purchase")
                        }
                        .buttonStyle(BorderlessButtonStyle())
                        .disabled(self.heartBeater.points < heartGenerator.price)
                    }
                }
            }
            
            Spacer()
        }
        .padding(20)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
