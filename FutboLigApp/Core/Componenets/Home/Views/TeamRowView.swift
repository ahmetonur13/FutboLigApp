//
//  TeamView.swift
//  FutboLigApp
//
//  Created by Ahmet Onur on 11.10.2024.
//

import SwiftUI
import SharedFramework

struct TeamView: View {
    @State var repeatAnimation : Bool = false
    let competition : CompetitionTeams
    var body: some View {
        HStack{
            if let emblemURLString = competition.competition?.emblem , let key = competition.competition?.name {
                ImageView(urlString: emblemURLString , key: key)
                    .frame(maxHeight: 40) // İstenilen boyut
            } else {
                Image(systemName: "info")
                    .resizable() // İkonun boyutunu ayarlamak için
                    .scaledToFit() // Ölçeklendirme
                    .frame(width: 40, height: 40) // İstenilen boyut
            }
            Spacer()
            Text("\(competition.competition?.name  ?? "" )")
            Spacer()
            Text(competition.competition?.code ?? "" )
                .font(.subheadline)
            Spacer()
            NavigationLink(destination: TeamDetailView(competition: competition )) {
                IconView(iconName: "chevron.right")
                    .padding(.horizontal)
                    .font(.subheadline)
                    .animation(.none)
                    .background(
                        IconAnimation(repeatAnimation: $repeatAnimation)
                    )
            }.buttonStyle(.plain)
        }.onAppear{
            repeatAnimation = true
        }
        .padding(.horizontal)
    }
}
