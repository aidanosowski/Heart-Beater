//
//  HeartBeater.swift
//  Heart Beater
//
//  Created by Aidan Osowski on 5/5/22.
//

import Foundation

class HeartBeater: ObservableObject {
    @Published var points = 0
    @Published var pointsPerSecond = 0
    @Published var pointGenerators: [ HeartGenerator ] = [
        HeartGenerator(name: "Point Generator #1", heartsPerSecond: 1, price: 50),
        HeartGenerator(name: "Point Generator #2", heartsPerSecond: 2, price: 100),
        HeartGenerator(name: "Point Generator #3", heartsPerSecond: 5, price: 250),
       HeartGenerator(name: "Point Generator #4", heartsPerSecond: 10, price: 500)]
    var timer: Timer?
    
    init() {
        self.points = 1
        self.timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { _ in
            self.tick()
        })
    }
    
    func click() {
        self.points += 1
    }
    
    func purchase(pointGenerator: HeartGenerator) {
        if pointGenerator.price <= self.points {
            self.points -= pointGenerator.price
            self.pointsPerSecond += pointGenerator.heartsPerSecond
        }
    }
    
    func tick() {
        self.points += self.pointsPerSecond
    }
}
