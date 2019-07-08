//
//  ChessPiecesView.swift
//  chess
//
//  Created by Daniel Kato on 7/4/19.
//  Copyright © 2019 Daniel Kato. All rights reserved.
//

import SwiftUI

let getBorderColor: (ChessBoard, Int, Int) -> Color = { (chessBoard, x, y) in
    chessBoard.chessPieces[[x, y]] != nil && chessBoard.chessPieces[[x, y]] == chessBoard.selectedChessPiece ? .blue : .clear
}

struct ChessPiecesView: View {
    @EnvironmentObject var chessBoard: ChessBoard
    @State var pieceSelected = false
    @State var lastSelectedPieceIdxs: [Int]? = nil
    var cellWidth: CGFloat

    var body: some View {
        print(self.chessBoard.chessPieces.map {(key, chessPiece) in [chessPiece.x, chessPiece.y] })
        return VStack(alignment: .center) {
            ForEach(0 ..< COLUMNS) { y in
                HStack(alignment: .center) {
                    ForEach(0 ..< ROWS) { x in
                        ChessPieceView(chessPiece: self.chessBoard.chessPieces[[x, y]], width: self.cellWidth)
                            .border(getBorderColor(self.chessBoard, x, y))
                            .tapAction {
                                self.handleTap(x: x, y: y)
                            }
                    }
                }
            }
        }
    }
    
    func handleTap(x: Int, y: Int) {
        if self.lastSelectedPieceIdxs != nil && self.lastSelectedPieceIdxs == [x, y] {
            self.chessBoard.chessPieces[[x, y]]?.setUnselected()
            self.chessBoard.setChessPieceUnselected()
            self.lastSelectedPieceIdxs = [9, 9]
            self.pieceSelected = false
            return
        }
        self.chessBoard.chessPieces[[x, y]]?.setSelected()
        if self.lastSelectedPieceIdxs != nil { self.chessBoard.chessPieces[self.lastSelectedPieceIdxs!]?.setUnselected()
        }
        self.chessBoard.setChessPieceSelected(x: x, y: y)
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
