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
    
struct ChessBoard : View {
    var body: some View {
        Group {
            Group {
                GeometryReader { geometry in
                    VStack(alignment: .center) {
                        ForEach((0..<ROWS)) { y in
                            HStack(alignment: .center) {
                                ForEach((0..<COLUMNS)) { x in
                                    BoardCell(x: x, y: y, width: getCellWidth(geometry))
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
struct ChessBoard_Previews : PreviewProvider {
    static var previews: some View {
        ChessBoard()
    }
}
#endif
