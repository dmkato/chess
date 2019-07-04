//
//  ChessPiece.swift
//  chess
//
//  Created by Daniel Kato on 6/29/19.
//  Copyright © 2019 Daniel Kato. All rights reserved.
//

import SwiftUI

let getColor: (Int, Int) -> String? = { x, y in
    switch y {
    case 0, 1:
        return "black"
    case 6, 7:
        return "white"
    default:
        return nil
    }
}

struct ChessPiece : View {
    let x: Int
    let y: Int
    let imageName: String?
    let width: CGFloat
    
    init(x: Int, y: Int, width: CGFloat) {
        self.x = x
        self.y = y
        self.width = width
        self.imageName = getImageName(x, y)
    }
    
    var body: some View {
        imageName.map { imageName in
            Image(imageName)
                .resizable()
                .frame(width: width * 0.8, height: width * 0.8)
                .shadow(radius: 7)
        }
    }
}

#if DEBUG
struct ChessPiece_Previews : PreviewProvider {
    static var previews: some View {
        HStack {
            ChessPiece(x: 0, y: 0, width: CGFloat(200))
            ChessPiece(x: 3, y: 3, width: CGFloat(200))
        }
    }
}
#endif
