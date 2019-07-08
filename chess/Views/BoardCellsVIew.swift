//
//  BoardCells.swift
//  chess
//
//  Created by Daniel Kato on 7/4/19.
//  Copyright © 2019 Daniel Kato. All rights reserved.
//

import SwiftUI

struct BoardCellsView: View {
    @EnvironmentObject var chessBoard: ChessBoard
    var cellWidth: CGFloat
    var body: some View {
        VStack(alignment: .center) {
            ForEach(self.chessBoard.cells.identified(by: \.self)) { rows in
                HStack(alignment: .center) {
                    ForEach(rows.identified(by: \.self)) { cell in
                        BoardCellView(cell: cell, width: self.cellWidth)
                            .animation(.basic())
                            .tapAction {
                                self.handleTap(cell: cell)
                            }
                        
                    }
                }
            }
        }
    }
    
    func handleTap(cell: Cell) {
        if let selectedChessPiece = chessBoard.selectedChessPiece {
            let coords = [selectedChessPiece.x, selectedChessPiece.y]
            chessBoard.movePiece(chessPiece: self.chessBoard.chessPieces[coords]!, cell: cell)
            chessBoard.setChessPieceUnselected()
        }
    }
}

#if DEBUG
    struct BoardCellsView_Previews: PreviewProvider {
        
        static var previews: some View {
            BoardCellsView(cellWidth: CGFloat(100))
                .environmentObject(ChessBoard())
        }
    }
#endif
