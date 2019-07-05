//
//  BoardCell.swift
//  chess
//
//  Created by Daniel Kato on 6/29/19.
//  Copyright © 2019 Daniel Kato. All rights reserved.
//

import SwiftUI


let getCellColor: (CellModel) -> Color = { cell in
    switch cell.cellColor {
    case .white:
        return Color.init(white: 0.2)
    case .black:
        return Color.init(white: 1)
    }
}

struct BoardCell : View {
    var cell: CellModel
    var width: CGFloat
    
    var body: some View {
        Rectangle()
            .frame(width: width, height: width, alignment: .center)
            .foregroundColor(getCellColor(cell))
            .padding(-4)
    }
}

#if DEBUG
struct BoardCell_Previews : PreviewProvider {
    static var previews: some View {
        VStack {
            HStack {
                BoardCell(cell: CellModel(x: 0, y: 0), width: CGFloat(200))
                BoardCell(cell: CellModel(x: 1, y: 0), width: CGFloat(200))
            }
            HStack {
                BoardCell(cell: CellModel(x: 0, y: 1), width: CGFloat(200))
                BoardCell(cell: CellModel(x: 1, y: 1), width: CGFloat(200))
            }
        }
    }
}
#endif
