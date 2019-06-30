//
//  ChessBoard.swift
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
    @State var chessboard: ChessboardModel = ChessboardModel()
    var body: some View {
        Group {
            Group {
                GeometryReader { geometry in
                    VStack(alignment: .center) {
                        ForEach(chessboard.cells) { column in
                            HStack(alignment: .center) {
                                ForEach(column) { cell in
                                    BoardCellView(cell: cell, width: getCellWidth(geometry))
                                }
                            }
                        }
                    }
                }
            }.frame(width: UIScreen.main.bounds.width - 20,
                    height: UIScreen.main.bounds.width - 20,
                    alignment: .center)
            .cornerRadius(20)
        }
    }
}

#if DEBUG
struct ChessBoardView_Previews : PreviewProvider {
    static var previews: some View {
        ChessBoardView()
    }
}
#endif
