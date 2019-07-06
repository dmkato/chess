//
//  ChessPiecesView.swift
//  chess
//
//  Created by Daniel Kato on 7/4/19.
//  Copyright © 2019 Daniel Kato. All rights reserved.
//

import SwiftUI

struct ChessPiecesView: View {
    var chessBoard: ChessBoard
    var cellWidth: CGFloat

    var body: some View {
        VStack(alignment: .center) {
            ForEach(0 ..< COLUMNS) { y in
                HStack(alignment: .center) {
                    ForEach(0 ..< ROWS) { x in
                        ChessPieceView(chessPiece: self.chessBoard.chessPieces.first { chessPiece in
                            chessPiece.x == x && chessPiece.y == y
                        }, width: self.cellWidth)
                            .tapAction {
                                if let chessPiece = self.chessBoard.chessPieces.first(where: { chessPiece in
                                    chessPiece.x == x && chessPiece.y == y
                                }) {
                                    print(chessPiece)
                                }
                            }
                    }
                }
            }
        }
    }
}

#if DEBUG
    struct ChessPiecesView_Previews: PreviewProvider {
        static var previews: some View {
            ChessPiecesView(chessBoard: ChessBoard(), cellWidth: CGFloat(200))
        }
    }
#endif