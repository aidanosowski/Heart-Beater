//
//  GameState.swift
//  Heart Beater
//
//  Created by Aidan Osowski on 5/5/22.
//

import Foundation

class HeartBeater: ObservableObject {
    @Published var points = 0
    @Published var pointsPerSecond = 0
    @Published var pointGenerators: [ PointGenerator ] = [
        PointGenerator(name: "Heart Generator #1", pointsPerSecond: 1, price: 50),
        PointGenerator(name: "Heart Generator #2", pointsPerSecond: 2, price: 100),
        PointGenerator(name: "Heart Generator #3", pointsPerSecond: 5, price: 250),
       PointGenerator(name: "Heart Generator #4", pointsPerSecond: 10, price: 500)]
    var timer: Timer?
    //the code for the heart generator (gaining hearts every second)
    init() {
        self.points = 1
        self.timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { _ in
            self.tick()
        })
    }
    
    func click() {
        self.points += 1
    }
    
    func purchase(pointGenerator: PointGenerator) {
        if pointGenerator.price <= self.points {
            self.points -= pointGenerator.price
            self.pointsPerSecond += pointGenerator.pointsPerSecond
            //clarifying the amount of hearts needed to buy/select a heart generator amount (Hearts per/s)
        }
    }
    
    func tick() {
        self.points += self.pointsPerSecond
    }
}
