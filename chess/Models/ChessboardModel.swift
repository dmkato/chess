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

let createCells: ([ChessPieceModel]) -> [[CellModel]] = { (chessPieces: [ChessPieceModel]) in
    Array(0..<ROWS).map { y in
        Array(0..<COLUMNS).map { x in
            var chessPiece: ChessPieceModel? = chessPieces[0]
                CellModel(x: x, y: y, chessPiece: chessPiece)
        }
    }
}

let createChessPieces: () -> [ChessPieceModel] = {
    Array(0..<ROWS).flatMap { y in
        Array(0..<COLUMNS).map { x in
            ChessPieceModel(x: x, y: y)
        }
    }
}

struct ChessboardModel: Hashable {
    static func == (lhs: ChessboardModel, rhs: ChessboardModel) -> Bool {
        lhs.cells == rhs.cells
            && lhs.chessPieces == rhs.chessPieces
    }
    
    let cells: [[CellModel]]
    let chessPieces: [ChessPieceModel]
    
    init() {
        self.chessPieces = createChessPieces()
        self.cells = createCells(self.chessPieces)
    }
    
}
