//
//  HeartGenerator.swift
//  Heart Beater
//
//  Created by Aidan Osowski on 5/26/22.
//

import Foundation

struct HeartGenerator : Identifiable {
    var id = UUID()
    var name: String
    var heartsPerSecond: Int
    var price: Int
}
