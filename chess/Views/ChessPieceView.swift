//
//  ChessPieceView.swift
//  chess
//
//  Created by Daniel Kato on 6/29/19.
//  Copyright © 2019 Daniel Kato. All rights reserved.
//

import SwiftUI

struct ChessPieceView: View {
    let chessPiece: ChessPiece?
    let width: CGFloat
    
    var body: some View {
        Group {
            if (chessPiece?.imageName != nil) {
                Image(chessPiece!.imageName!)
                    .resizable()
                    .frame(width: width * 0.8, height: width * 0.8)
                    .shadow(radius: 7)
            }
        }.frame(width: width * 0.8, height: width * 0.8)
    }
}

#if DEBUG
struct ChessPieceView_Previews : PreviewProvider {
    static var previews: some View {
        HStack {
            ChessPieceView(chessPiece: ChessPiece(x: 0, y: 0), width: CGFloat(200))
            ChessPieceView(chessPiece: ChessPiece(x: 0, y: 1), width: CGFloat(200))
        }
    }
}
#endif
