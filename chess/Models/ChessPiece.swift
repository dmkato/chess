//
//  ChessPiece.swift
//  chess
//
//  Created by Daniel Kato on 6/29/19.
//  Copyright © 2019 Daniel Kato. All rights reserved.
//

import Foundation

enum ChessPieceType: String {
    case rook = "rook"
    case knight = "knight"
    case bishop = "bishop"
    case queen = "queen"
    case king = "king"
    case pawn = "pawn"
    
}

enum ChessPieceColorType: String {
    case black = "black"
    case white = "white"
}



let chessPieceMap: [ChessPieceType] = [
    .rook,
    .knight,
    .bishop,
    .queen,
    .king,
    .bishop,
    .knight,
    .rook
]

let getChessPieceColor: (Int, Int) -> ChessPieceColorType? = { x, y in
    switch y {
    case 0, 1:
        return .black
    case 6, 7:
        return .white
    default:
        return .white
    }
}

let getImageName: (Int, Int) -> String? = { x, y in
    if let color = getChessPieceColor(x, y), let piece = getChessPieceType(x, y) {
        return "\(piece.rawValue)-\(color.rawValue)"
    }
    return nil
}

let getChessPiece: (Int, Int) -> ChessPieceType? = { x, y in
    switch y {
    case 0, 7:
        return chessPieceMap[x]
    case 1, 6:
        return  .pawn
    default:
        return nil
    }
}

let getChessPieceType: (Int, Int) -> ChessPieceType? = { x, y in
    switch y {
    case 0, 7:
        return chessPieceMap[x]
    case 1, 6:
        return .pawn
    default:
        return nil
    }
}

struct ChessPiece: Hashable {
    var x: Int
    var y: Int
    var chessPieceColor: ChessPieceColorType?
    var imageName: String?
    var chessPiece: ChessPieceType?
    var selected: Bool
    
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
        self.chessPieceColor = getChessPieceColor(x, y)
        self.imageName = getImageName(x, y)
        self.chessPiece = getChessPiece(x, y)
        self.selected = false
    }
    
    mutating func setSelected() {
        self.selected = true
    }
    
    mutating func setUnselected() {
        self.selected = false
    }
    
}
