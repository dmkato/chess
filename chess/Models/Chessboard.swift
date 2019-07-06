//
//  ChessBoard.swift
//  chess
//
//  Created by Daniel Kato on 6/29/19.
//  Copyright © 2019 Daniel Kato. All rights reserved.
//

import Combine
import Foundation
import SwiftUI

let ROWS = 8
let COLUMNS = 8

let createCells: ([ChessPiece]) -> [[Cell]] = { (chessPieces: [ChessPiece]) in
    Array(0 ..< ROWS).map { y in
        Array(0 ..< COLUMNS).map { x in
            var chessPiece: ChessPiece? = chessPieces.first { chessPiece in
                chessPiece.x == x && chessPiece.y == y
            }
            return Cell(x: x, y: y, chessPiece: chessPiece)
        }
    }
}

let createChessPieces: () -> [ChessPiece] = {
    Array(0 ..< ROWS).flatMap { y in
        Array(0 ..< COLUMNS).map { x in
            ChessPiece(x: x, y: y)
        }
    }
}

struct ChessBoard: Hashable {
//    static func == (lhs: ChessBoard, rhs: ChessBoard) -> Bool {
//        lhs.cells == rhs.cells
//            && lhs.chessPieces == rhs.chessPieces
//    }
//
//    let didChange = PassthroughSubject<ChessBoard, Never>()

    let cells: [[Cell]]
    let chessPieces: [ChessPiece]

    init() {
        chessPieces = createChessPieces()
        cells = createCells(chessPieces)
    }
}