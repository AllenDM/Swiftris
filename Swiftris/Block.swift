//
//  Block.swift
//  Swiftris
//
//  Created by Allen Moody on 9/1/14.
//  Copyright (c) 2014 bloc. All rights reserved.
//

import Foundation
import SpriteKit

// #1
let NumberOfColors: UInt32 = 6


// #2
enum BlockColor: Int, Printable {
    
// #3
    case Blue = 0, Orange, Purple, Red, Teal, Yellow
    
// #4
    var spriteName: String {
        switch self {
        case .Blue:
            return "blue"
        case .Orange:
            return "orange"
        case .Purple:
            return "purple"
        case .Red:
            return "red"
        case .Teal:
            return "Teal"
        case .Yellow:
            return "yellow"
        }
    }
// #5
    var description: String {
        return self.spriteName
    }
// #6
    static func random() -> BlockColor {
        return BlockColor.fromRaw(Int(arc4random_uniform(NumberOfColors)))!
    }
    
}

// #1
class Block: Hashable, Printable {
// #2 
     // Constants
    let color: BlockColor
    
// #3
    // Properties
    var column: Int
    var row: Int
    var sprite: SKSpriteNode?
    
// #4
    var spriteName: String {
        return color.spriteName
    }
    
// #5
    var hashValue: Int {
        return self.column ^ self.row
    }
    
// #6
    var description: String {
        return "\(color): [\(column), \(row)]"
    }
    
    init(column:Int, row:Int, color:BlockColor) {
        self.column = column
        self.row = row
        self.color = color
    }
}

// #7
    func ==(lhs: Block, rhs: Block) -> Bool {
     return lhs.column == rhs.column && lhs.row == rhs.row && lhs.color.toRaw() == rhs.color.toRaw()
    }

    




