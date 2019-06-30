//
//  BoardCell.swift
//  chess
//
//  Created by Daniel Kato on 6/29/19.
//  Copyright © 2019 Daniel Kato. All rights reserved.
//

import SwiftUI



struct BoardCellView : View {
    var cell: CellModel
    var width: CGFloat
    @State var tapped: Bool = false
    
    func getCellColor() -> Color {
        switch cell.cellColor {
        case .black:
            return Color.init(white: 0.2)
        case .white:
            return Color.init(white: 0.95)
        }
    }
    
    var body: some View {
        ZStack{
            Rectangle()
                .frame(width: width, height: width, alignment: .center)
                .foregroundColor(getCellColor())
                .padding(-4)
            ChessPieceView(chessPiece: cell.chessPiece, width: width)
        }
    }
}

#if DEBUG
struct BoardCell_Previews : PreviewProvider {
    static var previews: some View {
        VStack {
            HStack {
                BoardCellView(cell: CellModel(x: 0, y: 0), width: CGFloat(200))
                BoardCellView(cell: CellModel(x: 1, y: 0), width: CGFloat(200))
            }
            HStack {
                BoardCellView(cell: CellModel(x: 0, y: 1), width: CGFloat(200))
                BoardCellView(cell: CellModel(x: 1, y: 1), width: CGFloat(200))
            }
        }
    }
}
#endif
