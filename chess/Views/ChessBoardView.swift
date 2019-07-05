//
//  ChessBoardView.swift
//  chess
//
//  Created by Daniel Kato on 6/29/19.
//  Copyright © 2019 Daniel Kato. All rights reserved.
//

import SwiftUI

let getCellWidth: (GeometryProxy) -> CGFloat = { geometry in
    geometry.size.width / CGFloat(ROWS)
}
    
struct ChessBoardView : View {
    var ChessBoard: ChessBoard;
    var body: some View {
        Group {
            Group {
                GeometryReader { geometry in
                    ZStack {
                        BoardCellsView(cellWidth: getCellWidth(geometry), cells: self.ChessBoard.cells)
                        ChessPiecesView(cellWidth: getCellWidth(geometry), chessPieces: self.ChessBoard.chessPieces)
                    }
                }
            }.frame(width: UIScreen.main.bounds.width - 20,
                    height: UIScreen.main.bounds.width - 20,
                    alignment: .center)
            .cornerRadius(20)
            .shadow(radius: 10)
            
        }.padding(40)
    }
}

#if DEBUG
struct ChessBoardView_Previews : PreviewProvider {
    static var previews: some View {
        ChessBoardView(ChessBoard: ChessBoard())
    }
}
#endif
