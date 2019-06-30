//
//  ChessboardModel.swift
//  chess
//
//  Created by Daniel Kato on 6/29/19.
//  Copyright © 2019 Daniel Kato. All rights reserved.
//

import Foundation

let ROWS = 8
let COLUMNS = 8



let createCells: () -> [[CellModel]] = {
    Array(0..<ROWS).map { x in
        Array(0..<COLUMNS).map { y in
            CellModel(x: x, y: y)
        }
    }
}

struct ChessboardModel {
    let cells: [[CellModel]]
    
    init() {
        self.cells = createCells()
    }
    
}
