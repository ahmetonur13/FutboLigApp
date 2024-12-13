//
//  TeamMatchesView.swift
//  FutboLigApp
//
//  Created by Ahmet Onur on 11.11.2024.
//

import SwiftUI
import SharedFramework

struct TeamMatchesLoadingView : View {
    let teamId : Int?
    var body: some View {
        ZStack{
            if let teamId = teamId{
                TeamMatchesView(teamId: teamId)
            }
        }
    }
}
struct TeamMatchesView: View {
    @StateObject var vm : TeamMatchViewModel
    @State private var selection : TeamSelection = .fixtures
    let teamId : Int?
    init(teamId : Int?) {
        _vm = StateObject(wrappedValue: TeamMatchViewModel(teamId: teamId, teamMatchesApiKey: Environment.teamMatchesApiKey))
        self.teamId = teamId
//        print("TeamMatchesView init for \(teamId)")
    }
    var body: some View {
        ScrollView(showsIndicators : false){
            if let team = vm.team , let matches = team.matches{
                VStack{
                    Picker("Select a Section", selection: $selection) {
                        ForEach(TeamSelection.allCases , id: \.self) { selection in
                            Text(selection.rawValue)
                                .tag(selection)
                        }
                    }.pickerStyle(.segmented)
                        .padding()
                    LazyVStack{
                        if selection == .teamDetails {
                                if let teamId = teamId{
                                    TeamsView(playerId: teamId)
                                }
                        }else if selection == .fixtures {
                            Section{
                                let uniqueMatches = Dictionary(grouping: matches, by: { $0.id }).compactMapValues { $0.first }.values
                                var groupedMatches: [Competition? : [Match]] {
                                    Dictionary(grouping: uniqueMatches, by: { $0.competition })
                                }
                                if !groupedMatches.isEmpty{
                                    ForEach(Array(groupedMatches), id: \.key) { key , matches in
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
                                        }                                    }
                                }
                            } header: {
                                    headerView
                            }
                        }
                    }
                }
            }else {
                ProgressView()
            }       
        }
    }
}
//
//#Preview {
//    NavigationView{
//        TeamMatchesView(teamId: 582)
//    }
//}

extension TeamMatchesView{
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
