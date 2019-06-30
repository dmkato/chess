//
//  ContentView.swift
//  chess
//
//  Created by Daniel Kato on 6/29/19.
//  Copyright © 2019 Daniel Kato. All rights reserved.
//

import SwiftUI

let ROWS = 8
let COLUMNS = 8

struct ContentView : View {
    var body: some View {
        Group{
            ChessBoard()
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
