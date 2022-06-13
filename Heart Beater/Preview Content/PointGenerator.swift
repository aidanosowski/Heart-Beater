//
//  HeartGenerator.swift
//  Heart Beater
//
//  Created by Aidan Osowski on 5/26/22.
//

import Foundation

struct PointGenerator : Identifiable {
    var id = UUID()
    var name: String
    var pointPerSecond: Int
    var price: Int
}
