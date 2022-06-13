//
//  ContentView.swift
//  Heart Beater
//
//  Created by Aidan Osowski on 5/5/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var gameState = GameState()
    
    var body: some View {
        VStack() {
            Button(action: {
                self.gameState.click()
            }) {
                Text("Heart me!")
                // clicking button text
            }
            .padding(10)
            .background(Color.red)
            .foregroundColor(.black)
            //app color
            Text("\(gameState.points) hearts")
            
            if gameState.pointspersecond > 0 {
                Text("\(gameState.pointsPerSecond) hearts/s")
            }
            
            List(heartBeater.HeartGenerator) { heartGenerator in
                HStack {
                    VStack(alignment: .leading) {
                        Text(heartGenerator.name)
                        Text("\(heartGenerator.heartsPerSecond) hearts/s")
                        Text("Price: \(pointGenerator.price) hearts")
                        //in-game text for hearts + the amount of hearts (point generator)
                    }
                    Spacer()
                    Group {
                        Button(action: {
                            self.gameState.purchase(pointGenerator: pointGenerator)
                        }) {
                            Text("Purchase")
                        }
                        .buttonStyle(BorderlessButtonStyle())
                        .disabled(self.gameState.points < pointGenerator.price)
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
