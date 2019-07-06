//
//  ChessPiecesView.swift
//  chess
//
//  Created by Daniel Kato on 7/4/19.
//  Copyright © 2019 Daniel Kato. All rights reserved.
//

import SwiftUI

// TODO: Replace find x, y in array with a dictionary with key (x, y)
let getBoarderColor: (ChessBoard, Int, Int) -> Color = { (chessBoard, x, y) in
    chessBoard.chessPieces.first(where: { chessPiece in
        chessPiece.x == x && chessPiece.y == y
    })?.selected ?? false ? .black : .clear
}

struct ChessPiecesView: View {
    @EnvironmentObject var chessBoard: ChessBoard
    var cellWidth: CGFloat

    var body: some View {
        VStack(alignment: .center) {
            ForEach(0 ..< COLUMNS) { y in
                HStack(alignment: .center) {
                    ForEach(0 ..< ROWS) { x in
                        ChessPieceView(chessPiece: self.chessBoard.chessPieces.first { chessPiece in
                            chessPiece.x == x && chessPiece.y == y
                        }, width: self.cellWidth)
                            .border(getBoarderColor(self.chessBoard, x, y))
                            .tapAction {
                                self.chessBoard.chessPieces.enumerated().forEach { (idx, chessPiece) in
                                    return chessPiece.x == x && chessPiece.y == y
                                        ? self.chessBoard.chessPieces[idx].setSelected()
                                        : self.chessBoard.chessPieces[idx].setUnselected()
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
            ChessPiecesView(cellWidth: CGFloat(100))
            .environmentObject(ChessBoard())
        }
    }
#endif
