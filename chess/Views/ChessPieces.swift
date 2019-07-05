//
//  ChessPieces.swift
//  chess
//
//  Created by Daniel Kato on 7/4/19.
//  Copyright © 2019 Daniel Kato. All rights reserved.
//

import SwiftUI

struct ChessPieces : View {
    var cellWidth: CGFloat
    var chessPieces: [[ChessPieces]]
    var body: some View {
        VStack(alignment: .center) {
            ForEach(self.cells.identified(by: \.self)) { rows in
                HStack(alignment: .center) {
                    ForEach(rows.identified(by: \.self)) { cell in
                        ChessPiece(chessPiece: <#T##ChessPieceModel?#>, width: <#T##CGFloat#>)
                    }
                }
            }
        }
    }
}

#if DEBUG
struct ChessPieces_Previews : PreviewProvider {
    static var previews: some View {
        ChessPieces(cellWidth: CGFloat(20), cells: [[CellModel(x: 1, y: 1)]])
    }
}
#endif
