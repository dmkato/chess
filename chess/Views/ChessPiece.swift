//
//  ChessPiece.swift
//  chess
//
//  Created by Daniel Kato on 6/29/19.
//  Copyright © 2019 Daniel Kato. All rights reserved.
//

import SwiftUI

let getWidth: (CGFloat) -> CGFloat = { width in
    width * 0.91
}

struct ChessPiece : View {
    let chessPiece: ChessPieceModel?
    let width: CGFloat
    @State var border: Color = .clear
    
    var body: some View {
        Group {
            if (chessPiece?.imageName != nil) {
                Image(chessPiece!.imageName!)
                    .resizable()
                    .frame(width: getWidth(width), height: getWidth(width))
                    .border(self.border, width: 5)
                    .shadow(radius: 7)
            } else {
                Rectangle()
                    .frame(width: getWidth(width), height: getWidth(width))
                    .foregroundColor(.clear)
            }
        }
    }
}

#if DEBUG
struct ChessPiece_Previews : PreviewProvider {
    static var previews: some View {
        HStack {
            ChessPiece(chessPiece: ChessPieceModel(x: 0, y: 0), width: CGFloat(200))
            ChessPiece(chessPiece: ChessPieceModel(x: 2, y: 2), width: CGFloat(200))
        }
    }
}
#endif
