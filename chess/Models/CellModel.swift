//
//  CellModel.swift
//  chess
//
//  Created by Daniel Kato on 6/29/19.
//  Copyright © 2019 Daniel Kato. All rights reserved.
//

import Foundation

let getCellColorType: (Int, Int) -> CellColorType = { x, y in
    x.isMultiple(of: 2) != y.isMultiple(of: 2) ? .white : .black
}


struct CellModel: Hashable{
    static func == (lhs: CellModel, rhs: CellModel) -> Bool {
        lhs.chessPiece == rhs.chessPiece
            && lhs.cellColor == rhs.cellColor
            && lhs.x == rhs.x
            && lhs.y == rhs.y
    }
    
    var x: Int
    var y: Int
    var cellColor: CellColorType
    var chessPiece: ChessPieceModel?
    
    init(x: Int, y: Int, chessPiece: ChessPieceModel?) {
        self.cellColor = getCellColorType(x, y)
        self.chessPiece = chessPiece
        self.x = x
        self.y = y
    }
}
