//
//  StatsCard.swift
//  chess
//
//  Created by Daniel Kato on 6/30/19.
//  Copyright © 2019 Daniel Kato. All rights reserved.
//

import SwiftUI

struct StatsCard : View {
    var player: Int
    var body: some View {
        Group {
            ZStack(alignment: player == 2 ? .bottom : .top){
                Rectangle()
                    .frame(width: UIScreen.main.bounds.width - 20, height: 300, alignment: .center)
                    .cornerRadius(20)
                    .shadow(radius: 10)
                    .foregroundColor(.white)
                HStack{
                    Text("Player \(player)")
                        .font(.title)
                    .rotationEffect(.degrees(player == 2 ? 180 : 0))
                }.padding()
            }
        }
    }
}

#if DEBUG
struct StatsCard_Previews : PreviewProvider {
    static var previews: some View {
        StatsCard(player: 1)
    }
}
#endif
