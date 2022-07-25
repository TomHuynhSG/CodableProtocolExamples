//
//  Student.swift
//  CodableTesting
//
//  Created by Tom Huynh on 7/25/22.
//

import Foundation

struct Student: Codable {
    var name: String
    var email: String
    var age: Int
    var address: Address
}
struct Address: Codable {
    var number: Int
    var street: String
}
