//
//  BoardCells.swift
//  chess
//
//  Created by Daniel Kato on 7/4/19.
//  Copyright © 2019 Daniel Kato. All rights reserved.
//

import SwiftUI

struct BoardCellsView: View {
    var cellWidth: CGFloat
    var cells: [[Cell]]
    var body: some View {
        VStack(alignment: .center) {
            ForEach(self.cells.identified(by: \.self)) { rows in
                HStack(alignment: .center) {
                    ForEach(rows.identified(by: \.self)) { cell in
                        BoardCellView(cell: cell, width: self.cellWidth)
                    }
                }
            }
        }
    }
}

#if DEBUG
    struct BoardCellsView_Previews: PreviewProvider {
        static var previews: some View {
            BoardCellsView(cellWidth: CGFloat(200), cells: [[
                Cell(x: 0, y: 1, chessPiece: nil),
                Cell(x: 0, y: 0, chessPiece: nil),
                Cell(x: 0, y: 1, chessPiece: nil),
                Cell(x: 1, y: 1, chessPiece: nil),
            ]])
        }
    }
#endif