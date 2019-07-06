//
//  ChessPieceView.swift
//  chess
//
//  Created by Daniel Kato on 6/29/19.
//  Copyright © 2019 Daniel Kato. All rights reserved.
//

import SwiftUI

let getWidth: (CGFloat) -> CGFloat = { width in
    width * 0.91
}

struct ChessPieceView: View {
    @State var border: Color = .clear
    let chessPiece: ChessPiece?
    let width: CGFloat
    
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
struct ChessPieceView_Previews : PreviewProvider {
    static var previews: some View {
        HStack {
            ChessPieceView(chessPiece: ChessPiece(x: 0, y: 0), width: CGFloat(200))
            ChessPieceView(chessPiece: ChessPiece(x: 2, y: 2), width: CGFloat(200))
        }
    }
}
#endif
