//
//  FootballPlayerDetailView.swift
//  FutboLigApp
//
//  Created by Ahmet Onur on 13.10.2024.
//

import SwiftUI
import SharedFramework

struct FootballPlayerDetailView: View {
    @State private var selection : PlayerSelection = .playerDetails
    let scorers : Scorers?
    var body: some View {
        VStack{
            Picker("Select a Selection", selection: $selection) {
                ForEach(PlayerSelection.allCases , id: \.self) { selection in
                    Text(selection.rawValue)
                        .tag(selection)
                }
            }.pickerStyle(.segmented)
                .padding()
            LazyVStack{
                    if selection == .playerDetails{
                        playerDetailsView
                    }else if selection == .lastMatches{
                        if let scorers = scorers,  let player = scorers.player, let id = player.id{
                            FootballPlayerView(personId: id)
                        }else {
                            Text("Not Found Any Players")
                    }
                }
            }
            Spacer()
        }
    }
}

extension FootballPlayerDetailView {
    private var playerDetailsView : some View {
        VStack{
        if let scorers = scorers ,let player = scorers.player , let team = scorers.team{
            ImageView(urlString: team.crest, key: team.name)
                .frame(maxHeight: 50)
            HStack{
                VStack(alignment: .leading){
                    if let name = player.name , let nationality = player.nationality{
                        CostumVStackView(title : "Player Name" , name: name)
                        CostumVStackView(title : "Nationality" , name: nationality)
                    }
                }
                Spacer()
                VStack(alignment: .leading){
                    CostumVStackView(title : "Team Name" , name: team.name)
                    if let position = player.section{
                        CostumVStackView(title : "Position" , name: position)
                    }
                }
            }.padding(.horizontal)
            Spacer()
        }}
        }
}

struct CostumVStackView : View{
    let title : String
    let name : String
    var body: some View{
        VStack(alignment: .leading){
            Text(title)
                .font(.subheadline)
                .bold()
                .foregroundStyle(.gray)
            Text(name)
                .font(.subheadline)
                .bold()
        }
    }
}
