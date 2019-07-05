//
//  BoardCells.swift
//  chess
//
//  Created by Daniel Kato on 7/4/19.
//  Copyright © 2019 Daniel Kato. All rights reserved.
//

import SwiftUI

struct BoardCells : View {
    var cellWidth: CGFloat
    var cells: [[CellModel]]
    var body: some View {
        VStack(alignment: .center) {
            ForEach(self.cells.identified(by: \.self)) { rows in
                HStack(alignment: .center) {
                    ForEach(rows.identified(by: \.self)) { cell in
                        BoardCell(cell: cell, width: self.cellWidth)
                    }
                }
            }
        }
    }
}

#if DEBUG
struct BoardCells_Previews : PreviewProvider {
    static var previews: some View {
        BoardCells(cellWidth: CGFloat(20), cells: [[CellModel(x: 0, y: 0, chessPiece: <#ChessPieceModel?#>)]])
    }
}
#endif
