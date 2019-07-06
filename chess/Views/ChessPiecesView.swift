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
    chessBoard.chessPieces[[x, y]]?.selected ?? false ? .blue : .clear
}

struct ChessPiecesView: View {
    @EnvironmentObject var chessBoard: ChessBoard
    @State var pieceSelected = false
    @State var lastSelectedPieceIdxs = [9, 9]
    var cellWidth: CGFloat

    var body: some View {
        VStack(alignment: .center) {
            ForEach(0 ..< COLUMNS) { y in
                HStack(alignment: .center) {
                    ForEach(0 ..< ROWS) { x in
                        ChessPieceView(chessPiece: self.chessBoard.chessPieces[[x, y]], width: self.cellWidth)
                            .border(getBoarderColor(self.chessBoard, x, y))
                            .tapAction {
                                self.handleTap(x: x, y: y)
                            }
                        
                    }
                }
            }
        }
    }
    
    func handleTap(x: Int, y: Int) {
        if [x, y] == self.lastSelectedPieceIdxs {
            self.chessBoard.chessPieces[[x, y]]?.setUnselected()
            self.lastSelectedPieceIdxs = [9, 9]
            return
        }
        self.chessBoard.chessPieces[[x, y]]?.setSelected()
        self.chessBoard.chessPieces[self.lastSelectedPieceIdxs]?.setUnselected()
        self.lastSelectedPieceIdxs = [x, y]
        self.pieceSelected = true
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
