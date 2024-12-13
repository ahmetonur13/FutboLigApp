//
//  SwiftUIView.swift
//  FutboLigApp
//
//  Created by Ahmet Onur on 24.10.2024.
//

import SwiftUI
import SharedFramework

struct TeamsView: View {
    @StateObject var vm : TeamsViewModel
    @State private var player : Scorers? = nil
    @State private var showPlayerDetails : Bool = false
    init(playerId : Int) {
        _vm = StateObject(wrappedValue: TeamsViewModel(playerId: playerId, teamDataServiceApiKey: Environment.teamDataServiceApiKey))
        print("TeamsView init for \(playerId)")
    }
    
    var body: some View {
        ScrollView(showsIndicators: false){
            VStack{
                if let team = vm.team , let player = team.squad {
                    ImageView(urlString: team.crest , key: team.name)
                        .frame(maxWidth: 40)
                    Text(team.name)
                        .font(.title)
                        .bold()
                    HStack{
                        if let coach = team.coach , let name = coach.name{
                            VStack(alignment: .leading){
                                Text("Team Coach")
                                    .bold()
                                    .font(.subheadline)
                                    .foregroundStyle(.gray)
                                Text(name)
                                    .bold()
                                    .font(.subheadline)
                            }
                        }
                        Spacer()
                        if let area = team.area , let name = area.name{
                            VStack(alignment: .leading){
                                Text("Area")
                                    .font(.subheadline)
                                    .bold()
                                    .foregroundStyle(.gray)
                                Text(name)
                                    .bold()
                                    .font(.subheadline)
                            }.padding(.horizontal , 40)
                        }
                    }.padding(.horizontal)
                    Section {
                        ForEach(player , id: \.id){ player in
                            if let name = player.name , let position = player.position {
                                HStack{
                                    Text(name)
                                    Spacer()
                                    Text(position)
                                }.background(
                                    Color.black.opacity(0.001)
                                )
                                .frame(maxWidth : .infinity , alignment : .leading)
                                    .padding(.horizontal)
                                    .onTapGesture {
                                        segue(player: Scorers(player: player , team: team))
                                    }
                            }
                        }
                    } header: {
                        HStack{
                            Text("Player Name")
                            Spacer()
                            Text("Player Position")
                        }.font(.subheadline)
                            .foregroundStyle(.gray)
                            .padding(.horizontal)
                    }
                    
                }else {
                    ProgressView()
                }
            }
        }.background(
        NavigationLink(
            destination: FootballPlayerDetailView(scorers: player),
            isActive: $showPlayerDetails,
            label: {EmptyView()})
        )
    }
}
extension TeamsView {
    private func segue(player : Scorers) {
        self.player = player
        showPlayerDetails.toggle()
    }
}
#Preview {
    TeamsView(playerId: 20)
}
