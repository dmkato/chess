//
//  ChessPiecesView.swift
//  chess
//
//  Created by Daniel Kato on 7/4/19.
//  Copyright © 2019 Daniel Kato. All rights reserved.
//

import SwiftUI

struct ChessPiecesView: View {
    var cellWidth: CGFloat
    var chessPieces: [ChessPiece]
    
    var body: some View {
        VStack(alignment: .center) {
            ForEach(0..<COLUMNS) { y in
                HStack(alignment: .center) {
                    ForEach(0..<ROWS) { x in
                        ChessPieceView(chessPiece: self.chessPieces.first { chessPiece in
                            chessPiece.x == x && chessPiece.y == y
                        }, width: self.cellWidth)
                    }
                }
            }
        }
    }
}

#if DEBUG
struct ChessPiecesView_Previews : PreviewProvider {
    static var previews: some View {
        ChessPiecesView(cellWidth: CGFloat(200), chessPieces: [ChessPiece(x: 0, y: 0), ChessPiece(x: 1, y: 0)])
    }
}
#endif
