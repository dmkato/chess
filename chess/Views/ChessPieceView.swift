//
//  ChessPiece.swift
//  chess
//
//  Created by Daniel Kato on 6/29/19.
//  Copyright © 2019 Daniel Kato. All rights reserved.
//

import SwiftUI

struct ChessPieceView : View {
    var chessPiece: ChessPieceModel
    let width: CGFloat
    
    var body: some View {
        chessPiece.imageName.map { imageName in
            Image(chessPiece.imageName)
                .resizable()
                .frame(width: width * 0.8, height: width * 0.8)
        }
    }
}

#if DEBUG
struct ChessPiece_Previews : PreviewProvider {
    static var previews: some View {
        HStack {
            ChessPieceView(chessPiece: ChessPieceModel(chessPieceColor: .black, imageName: "king-white", chessPiece: .king), width: CGFloat(200))
        }
    }
}
#endif
