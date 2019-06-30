//
//  Chessboard.swift
//  chess
//
//  Created by Daniel Kato on 6/29/19.
//  Copyright © 2019 Daniel Kato. All rights reserved.
//

import Foundation

let chessPieceMap = [
    "rook",
    "knight",
    "bishop",
    "queen",
    "king",
    "bishop",
    "knight",
    "rook",
]

let createCells: () -> [Cell] = {
    [Cell()]
}

struct Chessboard {
    let cells: [Cell]
    
    init() {
        self.cells = createCells()
    }
    
}
