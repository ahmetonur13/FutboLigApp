//
//  StandingView.swift
//  FutboLigApp
//
//  Created by Ahmet Onur on 24.10.2024.
//

import SwiftUI
import SharedFramework

struct StandingView: View {
    let table: TeamTable

    var body: some View {
        HStack {
            Text("\(table.position)")
                .foregroundStyle(.gray)
            Spacer()
            ImageView(urlString: table.team.crest , key: table.team.name)
                .scaledToFit()
                .frame(maxHeight: 20)
            
            Spacer().frame(width: 10)
            Text(table.team.name)
                .font(.subheadline)
                .bold()
                .frame(width: 200, alignment: .leading) // Sabit genişlik ve hizalama
                .lineLimit(1)
            
            Spacer()
            Group{
                Text("\(table.playedGames)")
                Text("\(table.won)")
                Text("\(table.draw)")
                Text("\(table.lost)")
                Text("\(table.goalsFor)")
                Text("\(table.goalsAgainst)")
                Text("\(table.goalDifference)")
                Text("\(table.points)")
            }.frame(width: 30, alignment: .center)
        }.background(
            Color.black.opacity(0.001)
        )
    }
}
