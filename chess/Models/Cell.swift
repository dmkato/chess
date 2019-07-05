//
//  Cell.swift
//  chess
//
//  Created by Daniel Kato on 6/29/19.
//  Copyright © 2019 Daniel Kato. All rights reserved.
//

import Foundation

enum CellColor: String {
    case black = "black"
    case white = "white"
}

let getCellColor: (Int, Int) -> CellColor = { x, y in
    x.isMultiple(of: 2) != y.isMultiple(of: 2) ? .white : .black
}


struct Cell: Hashable{
    static func == (lhs: Cell, rhs: Cell) -> Bool {
        lhs.chessPiece == rhs.chessPiece
            && lhs.color == rhs.color
            && lhs.x == rhs.x
            && lhs.y == rhs.y
    }
    
    var x: Int
    var y: Int
    var color: CellColor
    var chessPiece: ChessPiece?
    
    init(x: Int, y: Int, chessPiece: ChessPiece?) {
        self.color = getCellColor(x, y)
        self.chessPiece = chessPiece
        self.x = x
        self.y = y
    }
}
