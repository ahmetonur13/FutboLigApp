//
//  FootballPlayerView.swift
//  FutboLigApp
//
//  Created by Ahmet Onur on 13.10.2024.
//

import SwiftUI
import SharedFramework

struct FootballPlayerView: View {
    @StateObject private var vm : FootballPlayerViewModel
    
    init(personId : Int ) {
        _vm = StateObject(wrappedValue: FootballPlayerViewModel(personId: personId, personFilter: .goal, playerMatchesApiKey: Environment.playerMatchesApiKey))
    }
    
    var body: some View {
        ScrollView(showsIndicators: false){
            VStack{
                if let match = vm.footballPlayerMatches ,
                   let person = match.person , let name = person.name ,
                   let matches = match.matches{
                    if let team = person.currentTeam {
                        ImageView(urlString: team.crest, key: team.name)
                    }
                    Text(name)
                        .font(.headline)
                    PersonMatchFilterPicker(personFilter: $vm.personFilter)
                    Section {
                        let uniqueMatches = Dictionary(grouping: matches, by: { $0.id }).compactMapValues { $0.first }.values
                        var groupedMatches: [Competition? : [Match]] {
                            Dictionary(grouping: uniqueMatches, by: { $0.competition })
                        }
                        if !groupedMatches.isEmpty{
                            ForEach(Array(groupedMatches), id: \.key) { key , matches in
                                VStack{
                                if let competition = key  , let name = competition.name{
                                    HStack{
                                        Text(name)
                                            .padding(.horizontal)
                                            .font(.headline)
                                            .foregroundStyle(.gray)
                                        Spacer()
                                    }
                                }
                                let matchesByMatchday = Dictionary(grouping: matches, by: { $0.matchday ?? 0 })
                                let sortedMatchdays = matchesByMatchday.keys.sorted()

                                ForEach(sortedMatchdays, id: \.self) { matchday in
                                    if let matchesForDay = matchesByMatchday[matchday] {
                                        ForEach(matchesForDay, id: \.id) { match in
                                            MatchTableColunmView(match: match)
                                        }
                                    }
                                }
                            }}
                        }else{
                            Text("None Any \(vm.personFilter.listOfPersonMatchFilter)")
                                .font(.headline)
                                .foregroundStyle(.gray)
                                .padding()
                        }
                    } header: {
                        headerView
                    }
                }else {
                    ProgressView()
                }
            }
        }
        
    }
}

extension FootballPlayerView{
    private var headerView : some View {
        HStack{
            Text("Home Team")
            Spacer()
            Text("Score")
            Spacer()
            Text("Away Team")
        }.padding(.horizontal)
            .font(.subheadline)
            .foregroundStyle(.gray)
    }
}

