//
//  CellModel.swift
//  chess
//
//  Created by Daniel Kato on 6/29/19.
//  Copyright © 2019 Daniel Kato. All rights reserved.
//

import Foundation

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

let getCellColorType: (Int, Int) -> CellColorType = { x, y in
    x.isMultiple(of: 2) != y.isMultiple(of: 2) ? .white : .black
}

let getImageName: (Int, Int) -> String? = { x, y in
    if let color = getChessPieceColor(x, y), let piece = getChessPieceType(x, y) {
        return "\(piece.rawValue)-\(color.rawValue)"
    }
    return nil
}

let getChessPiece: (Int, Int) -> ChessPieceModel? = { x, y in
    switch y {
    case 0, 7:
        return ChessPieceModel(chessPieceColor: getChessPieceColor(x, y), imageName: getImageName(x, y), chessPiece: chessPieceMap[x])
    case 1, 6:
        return ChessPieceModel(chessPieceColor: getChessPieceColor(x, y), imageName: getImageName(x, y), chessPiece: .pawn)
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

struct CellModel {
    var x: Int
    var y: Int
    var cellColor: CellColorType
    var chessPiece: ChessPieceModel?
    
    init(x: Int, y: Int) {
        self.cellColor = getCellColorType(x, y)
        self.chessPiece = getChessPiece(x, y)
        self.x = x
        self.y = y
    }
}