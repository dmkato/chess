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
    Array([0,1,6,7])
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
    var didChange: PassthroughSubject<ChessBoard, Never>
    
    var selectedChessPiece: ChessPiece? {
        didSet {
            didChange.send(self)
        }
    }

    var cells: [[Cell]] {
        didSet {
            didChange.send(self)
        }
    }
    
    var chessPieces: [[Int]: ChessPiece] {
        didSet {
            didChange.send(self)
        }
    }

    init() {
        self.didChange = PassthroughSubject<ChessBoard, Never>()
        self.chessPieces = createChessPieces()
        self.cells = createCells(self.chessPieces)
        self.selectedChessPiece = nil
    }
    
    func setChessPieceSelected(x: Int, y: Int) {
        selectedChessPiece = self.chessPieces[[x, y]]
    }
    
    func setChessPieceUnselected() {
        selectedChessPiece = nil
    }
    
    func movePiece(chessPiece: ChessPiece, cell: Cell) {
        let srcCoords = [chessPiece.x, chessPiece.y]
        let targetCoords = [cell.x, cell.y]
        chessPieces[srcCoords]?.setPosition(cell: cell)
        chessPieces.removeValue(forKey: srcCoords)
        chessPieces[targetCoords] = chessPiece
    }
    
}
