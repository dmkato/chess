//
//  ContentView.swift
//  chess
//
//  Created by Daniel Kato on 6/29/19.
//  Copyright © 2019 Daniel Kato. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    var chessBoard = ChessBoard()
    var body: some View {
        VStack{
            StatsCardView(player:2)
            ChessBoardView(ChessBoard: chessBoard)
            StatsCardView(player:1)
        }
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
