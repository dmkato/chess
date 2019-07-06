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

let createCells: ([[Int]: ChessPiece]) -> [[Cell]] = { chessPieces in
    Array(0 ..< ROWS).map { y in
        Array(0 ..< COLUMNS).map { x in
            var chessPiece: ChessPiece? = chessPieces[[x, y]]
            return Cell(x: x, y: y, chessPiece: chessPiece)
        }
    }
}

let createChessPieces: () -> [[Int]: ChessPiece] = {
    Array(0 ..< ROWS)
        .flatMap { y in
            Array(0 ..< COLUMNS).map { x in
                ChessPiece(x: x, y: y)
            }
        }
        .reduce([[Int]: ChessPiece]()) { (dict, chessPiece) in
            var dict = dict
            dict[[chessPiece.x, chessPiece.y]] = chessPiece
            return dict
        }
}

class ChessBoard: BindableObject {
    var didChange = PassthroughSubject<Void, Never>()

    var cells: [[Cell]] {
        didSet {
            didChange.send(())
        }
    }
    
    var chessPieces: [[Int]: ChessPiece] {
        didSet {
            didChange.send(())
        }
    }

    init() {
        self.chessPieces = createChessPieces()
        self.cells = createCells(self.chessPieces)
    }
}
