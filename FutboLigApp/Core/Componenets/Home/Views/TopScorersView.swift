//
//  LeagueIstatisticView.swift
//  FutboLigApp
//
//  Created by Ahmet Onur on 16.11.2024.
//

import SwiftUI
import SharedFramework

struct TopScorersView: View {
    @StateObject private var vm : TopScorersViewModel
    @State private var scorers : Scorers? = nil
    @State private var showTpoScorersDetalils : Bool = false
    init(competitionModel : HomeViewModel) {
        _vm = StateObject(wrappedValue: TopScorersViewModel(competititonModel: competitionModel))
//        print("TopScorersView init for \(competitionModel)")
    }
     var body: some View {
        VStack{
            if let istatistics = vm.topScorers , let scorers = istatistics.scorers {
                ScrollView(.horizontal , showsIndicators: false){
                    Section{
                        ForEach(scorers , id: \.player?.id) { scorer in
                                HStack{
                                    if let team = scorer.team  , let player = scorer.player{
                                            ImageView(urlString: team.crest, key: team.name)
                                                .frame(maxHeight: 30)
                                        
                                        }
                                    if let player = scorer.player , let name = player.name{
                                        Text(name)
                                            .lineLimit(1)
                                            .frame(maxWidth: 200 , alignment: .leading)
                                    }
                                    Group{
                                        if let playedMatches = scorer.playedMatches {
                                            Text("\(playedMatches)")
                                        }else{
                                            Text("0")
                                        }
                                        if let goals = scorer.goals {
                                            Text("\(goals)")
                                        }else{
                                            Text("0")
                                        }
                                        if let assists = scorer.assists {
                                            Text("\(assists)")
                                        }else{
                                            Text("0")
                                        }
                                        if let penalties = scorer.penalties {
                                            Text("\(penalties)")
                                        }else{
                                            Text("0")
                                        }
                                    }.frame(width: 30, alignment: .center)
                                }.background(
                                    Color.black.opacity(0.001)
                                )
                                .onTapGesture {
                                    segue(scorers : scorer)
                                }
                        }
                    } header: {
                            HStack{
                                Text("Name")
                                    .frame(width: 230 , alignment: .leading)
                                Spacer()
                                Group{
                                    Text("MP")
                                    Text("G")
                                    Text("A")
                                    Text("P")
                                }.frame(width: 30, alignment: .center)
                            }
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        }
                    
                }
            }else {
                ProgressView()
            }
        }.background(
            NavigationLink(
                destination: FootballPlayerDetailView(scorers : scorers),
                isActive: $showTpoScorersDetalils,
                label: {EmptyView()}))
    }
}

extension TopScorersView {
    private func segue(scorers : Scorers){
        self.scorers = scorers
        showTpoScorersDetalils.toggle()
    }
}

//#Preview {
//    TopScorersView(selectedCompetition: .cl)
//}
