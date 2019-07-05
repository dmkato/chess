//
//  ChessPieces.swift
//  chess
//
//  Created by Daniel Kato on 7/4/19.
//  Copyright © 2019 Daniel Kato. All rights reserved.
//

import SwiftUI

struct ChessPieces : View {
    var cellWidth: CGFloat
    var chessPieces: [ChessPieceModel]
    
    var body: some View {
        VStack(alignment: .center) {
            ForEach(0..<COLUMNS) { y in
                HStack(alignment: .center) {
                    ForEach(0..<ROWS) { x in
                        ChessPiece(chessPiece: self.chessPieces.first { chessPiece in
                            chessPiece.x == x && chessPiece.y == y
                        }, width: self.cellWidth)
                    }
                }
            }
        }
    }
}

#if DEBUG
struct ChessPieces_Previews : PreviewProvider {
    static var previews: some View {
        ChessPieces(cellWidth: CGFloat(200), chessPieces: [ChessPieceModel(x: 0, y: 0), ChessPieceModel(x: 1, y: 0)])
    }
}
#endif
