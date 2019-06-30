//
//  BoardCell.swift
//  chess
//
//  Created by Daniel Kato on 6/29/19.
//  Copyright © 2019 Daniel Kato. All rights reserved.
//

import SwiftUI


let getCellColor: (Int, Int) -> Color = { x, y in
    x.isMultiple(of: 2) != y.isMultiple(of: 2) ? Color.init(white: 0.2) : Color.init(white: 1)
}

struct BoardCell : View {
    var x: Int
    var y: Int
    var width: CGFloat
    @State var tapped: Bool = false
    
    var body: some View {
        ZStack{
            Rectangle()
                .frame(width: width, height: width, alignment: .center)
                .foregroundColor(getCellColor(x, y)).padding(-4)
            ChessPiece(x: x, y: y, width: width)
        }
    }
}

#if DEBUG
struct BoardCell_Previews : PreviewProvider {
    static var previews: some View {
        VStack {
            HStack {
                BoardCell(x: 0, y: 0, width: CGFloat(200))
                BoardCell(x: 1, y: 0, width: CGFloat(200))
            }
            HStack {
                BoardCell(x: 0, y: 1, width: CGFloat(200))
                BoardCell(x: 1, y: 1, width: CGFloat(200))
            }
        }
    }
}
#endif
