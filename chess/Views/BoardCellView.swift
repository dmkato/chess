//
//  BoardCellView.swift
//  chess
//
//  Created by Daniel Kato on 6/29/19.
//  Copyright © 2019 Daniel Kato. All rights reserved.
//

import SwiftUI

let getColorFromCellColor: (Cell) -> Color = { cell in
    switch cell.color {
    case .white:
        return Color(white: 0.2)
    case .black:
        return Color(white: 1)
    }
}

struct BoardCellView: View {
    var cell: Cell
    var width: CGFloat

    var body: some View {
        Rectangle()
            .frame(width: width, height: width, alignment: .center)
            .foregroundColor(getColorFromCellColor(cell))
            .padding(-4)
    }
}

#if DEBUG
    struct BoardCell_Previews: PreviewProvider {
        static var previews: some View {
            VStack {
                HStack {
                    BoardCellView(cell: Cell(x: 0, y: 0, chessPiece: ChessPiece(x: 0, y: 0)), width: CGFloat(200))
                    BoardCellView(cell: Cell(x: 1, y: 0, chessPiece: ChessPiece(x: 1, y: 0)), width: CGFloat(200))
                }
                HStack {
                    BoardCellView(cell: Cell(x: 0, y: 1, chessPiece: ChessPiece(x: 0, y: 1)), width: CGFloat(200))
                    BoardCellView(cell: Cell(x: 1, y: 1, chessPiece: ChessPiece(x: 1, y: 1)), width: CGFloat(200))
                }
            }
        }
    }
#endif